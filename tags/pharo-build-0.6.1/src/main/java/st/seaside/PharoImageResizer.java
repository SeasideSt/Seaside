package st.seaside;

import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import java.io.RandomAccessFile;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.channels.FileChannel.MapMode;

import org.kohsuke.stapler.DataBoundConstructor;
import org.kohsuke.stapler.StaplerRequest;

import hudson.Extension;
import hudson.FilePath;
import hudson.Launcher;
import hudson.model.BuildListener;
import hudson.model.AbstractBuild;
import hudson.model.AbstractProject;
import hudson.tasks.BuildStepDescriptor;
import hudson.tasks.Builder;
import st.seaside.PharoImageResizer.DescriptorImpl;

import static st.seaside.PharoUtils.addDotImage;
import static st.seaside.PharoUtils.getAbsoluteOrRelativePath;

/**
 * {@link Builder} for <a href="http://www.pharo-project.org/">Pharo</a>
 * images.
 *
 * <p>
 * When the user configures the project and enables this builder,
 * {@link DescriptorImpl#newInstance(StaplerRequest)} is invoked
 * and a new {@link PharoImageResizer} is created. The created
 * instance is persisted to the project configuration XML by using
 * XStream, so this allows you to use instance fields (like {@link #name})
 * to remember the configuration.
 *
 * <p>
 * When a build is performed, the {@link #perform(AbstractBuild, Launcher, BuildListener)} method
 * will be invoked.
 *
 * @author Philippe Marschall
 */
public class PharoImageResizer extends Builder {


  /**
   * Singleton instance of the global configuration descriptor.
   */
  @Extension
  public static final DescriptorImpl DESCRIPTOR = new DescriptorImpl();

  private final String image;
  private final int width;
  private final int height;

  @DataBoundConstructor
  public PharoImageResizer(String image, int width, int height) {
    this.image = addDotImage(image);
    this.width = width;
    this.height = height;
  }

  public String getImage() {
    // needed by Jelly, don't remove
    return this.image;
  }

  public int getWidth() {
    // needed by Jelly, don't remove
    return this.width;
  }

  public int getHeight() {
    // needed by Jelly, don't remove
    return this.height;
  }

  byte[] getWidthInLittleEndian() {
    return toLittleEndian(this.width);
  }

  byte[] getHeightInLittleEndian() {
    return toLittleEndian(this.height);
  }

  private static byte[] toLittleEndian(int i) {
    return new byte[]{(byte) (i & 0xFF), (byte) (i >> 8)};
  }

  private FilePath getImagePath(FilePath moduleRoot) {
    return getAbsoluteOrRelativePath(this.image, moduleRoot);
  }

  byte[] getDimensionMask() {
    byte[] data = new byte[4];
    System.arraycopy(this.getHeightInLittleEndian(), 0, data, 0, 2);
    System.arraycopy(this.getWidthInLittleEndian(), 0, data, 2, 2);
    return data;
  }


  static void logInfo(PrintStream logger, String message) {
    logger.print("[INFO] [PharoImageResizer] ");
    logger.println(message);
  }

  /**
   * {@inheritDoc}
   */
  @Override
  public boolean perform(AbstractBuild<?, ?> build, Launcher launcher, BuildListener listener)
      throws InterruptedException, IOException {


    FilePath moduleRoot = build.getModuleRoot();
    PrintStream logger = listener.getLogger();

    logStart(moduleRoot, logger);

    RandomAccessFile randomAccessFile = this.getImageFile(moduleRoot);
    try {
      resizeBio(randomAccessFile);
    } finally {
      randomAccessFile.close();
    }
    return true;
  }

  private void logStart(FilePath moduleRoot, PrintStream logger) {
    FilePath imagePath = getImagePath(moduleRoot);
    logInfo(logger, "resizing image " + imagePath.getRemote() + " to " + this.width + "x" + this.height);
  }

  private RandomAccessFile getImageFile(FilePath moduleRoot) throws IOException, InterruptedException {
    FilePath imagePath = getImagePath(moduleRoot);
    File file = new File(imagePath.toURI());
    return new RandomAccessFile(file, "rw");
  }

  private void resizeBio(RandomAccessFile file) throws IOException {
    file.seek(24L);
    file.write(this.getDimensionMask());
  }

  private void resizeNio(RandomAccessFile file) throws IOException {
    FileChannel channel = file.getChannel();
    MappedByteBuffer buffer = channel.map(MapMode.READ_WRITE, 24L, 4L);
    buffer.put(this.getDimensionMask());
    buffer.force();
  }


  /**
   * {@inheritDoc}
   */
  @Override
  public DescriptorImpl getDescriptor() {
    return DESCRIPTOR;
  }

  /**
   * Descriptor for {@link PharoImageResizer}. Used as a singleton.
   * The class is marked as public so that it can be accessed from views.
   *
   * <p>
   * See <tt>views/hudson/plugins/pharo-build/OneClickBuilder/*.jelly</tt>
   * for the actual HTML fragment for the configuration screen.
   */
  public static final class DescriptorImpl extends BuildStepDescriptor<Builder> {


    /**
     * Default constructor, loads the defaults first and then the saved data.
     */
    public DescriptorImpl() {
      super(PharoImageResizer.class);
      load();
    }

    /**
     * Constructor, only loads the defaults and not the saved data.
     *
     * @param clazz the builder class
     */
    protected DescriptorImpl(Class<? extends PharoBuilder> clazz) {
      super(clazz);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public boolean isApplicable(Class<? extends AbstractProject> jobType) {
      return true;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public String getDisplayName() {
      return Messages.imageResizer_displayName();
    }

  }

}
