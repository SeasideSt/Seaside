package st.seaside;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintStream;
import java.util.Map;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

import org.kohsuke.stapler.DataBoundConstructor;
import org.kohsuke.stapler.QueryParameter;
import org.kohsuke.stapler.StaplerRequest;

import hudson.Extension;
import hudson.FilePath;
import hudson.Launcher;
import hudson.Proc;
import hudson.Util;
import hudson.model.BuildListener;
import hudson.model.AbstractBuild;
import hudson.model.AbstractProject;
import hudson.tasks.BuildStepDescriptor;
import hudson.tasks.Builder;
import hudson.util.ArgumentListBuilder;
import hudson.util.FormValidation;
import net.sf.json.JSONObject;
import st.seaside.PharoBuilder.DescriptorImpl;


/**
 * {@link Builder} for <a href="http://www.pharo-project.org/">Pharo</a>
 * images.
 *
 * <p>
 * When the user configures the project and enables this builder,
 * {@link DescriptorImpl#newInstance(StaplerRequest)} is invoked
 * and a new {@link PharoBuilder} is created. The created
 * instance is persisted to the project configuration XML by using
 * XStream, so this allows you to use instance fields (like {@link #name})
 * to remember the configuration.
 *
 * <p>
 * When a build is performed, the {@link #perform(Build, Launcher, BuildListener)} method
 * will be invoked.
 *
 * @author Philippe Marschall
 */
public class PharoBuilder extends Builder {

  @Extension
  public static final DescriptorImpl DESCRIPTOR = new DescriptorImpl();

  //TODO check if we need to creat demon threads to allow the VM to shut down
  private static final ScheduledExecutorService EXECUTOR;

  static {
    EXECUTOR = Executors.newSingleThreadScheduledExecutor();
  }

  private final String inputImage;
  private final String outputImage;
  private final String code;
  private final String fileToWatch;

  // Fields in config.jelly must match the parameter names in the "DataBoundConstructor"
  @DataBoundConstructor
  public PharoBuilder(String inputImage, String outputImage, String code, String fileToWatch) {
    this.inputImage = stripDotImage(inputImage);
    this.outputImage = stripDotImage(outputImage);
    this.code = code;
    this.fileToWatch = fileToWatch;
  }

  public String getInputImage() {
    return this.inputImage;
  }

  public String getOutputImage() {
    return this.outputImage;
  }

  public String getCode() {
    return this.code;
  }

  public String getFileToWatch() {
    return this.fileToWatch;
  }

  public FilePath getImageToBuildAgainst(FilePath moduleRoot) {
    if (this.outputImage != null) {
      return moduleRoot.child(this.outputImage + ".image");
    } else {
      return moduleRoot.child(this.inputImage + ".image");
    }
  }

  private static String stripDotImage(String s) {
    if (s.endsWith(".image")) {
      return s.substring(0, s.length() - ".image".length());
    } else {
      return s;
    }
  }

  private boolean needToCopyImage() {
    return this.outputImage != null
    && !this.outputImage.isEmpty();
  }

  private void deleteDebugLog(FilePath moduleRoot) throws IOException, InterruptedException {
    FilePath debugLog = this.getDebugLog(moduleRoot);
    if (debugLog.exists()) {
      debugLog.delete();
    }
  }

  private FilePath getDebugLog(FilePath moduleRoot) {
    if (this.fileToWatch != null && !this.fileToWatch.isEmpty()) {
      return moduleRoot.child(this.fileToWatch);
    } else {
      return null;
    }
  }

  private String getContentsOfDebugLog(FilePath moduleRoot) throws IOException {
    FilePath debugLog = this.getDebugLog(moduleRoot);
    if (debugLog != null) {
      return debugLog.readToString();
    } else {
      return null;
    }
  }

  private void appendDebugLog(FilePath moduleRoot, BuildListener listener) throws IOException {
    String contents = this.getContentsOfDebugLog(moduleRoot);
    if (contents != null) {
      listener.fatalError(contents);
    }
  }

  private boolean copyImage(BuildListener listener, FilePath folder) throws IOException, InterruptedException {
    FilePath source = folder.child(this.inputImage + ".image");
    if (!source.exists()) {
      listener.fatalError(Messages.pharo_inputImageDoesNotExist());
      return false;
    }
    FilePath target = folder.child(this.outputImage + ".image");

    listener.getLogger().printf("copying %s to %s%n", source.getRemote(), target.getRemote());
    source.copyTo(target);
    return true;
  }

  private boolean copyChanges(BuildListener listener, FilePath folder) throws IOException, InterruptedException {
    FilePath source = folder.child(this.inputImage + ".changes");
    if (!source.exists()) {
      listener.fatalError(Messages.pharo_inputChangesDoesNotExist());
      return false;
    }

    FilePath target = folder.child(this.outputImage + ".changes");
    listener.getLogger().printf("copying %s to %s%n", source.getRemote(), target.getRemote());
    source.copyTo(target);
    return true;
  }

  private File getStartUpScript() throws IOException {
    File file = File.createTempFile("pharo_build", ".st");
    FileOutputStream stream = new FileOutputStream(file);
    try {
      OutputStreamWriter writer = new OutputStreamWriter(stream);
      String beforeCode = getDescriptor().getBeforeCode();
      if (beforeCode != null && !beforeCode.isEmpty()) {
        writer.write(beforeCode + "\n!\n");
      }
      writer.write(this.getCode() + "\n!\n");
      String afterCode = getDescriptor().getAfterCode();
      if (afterCode != null && !afterCode.isEmpty()) {
        writer.write(afterCode + "\n!\n");
      }
      writer.close();
    } finally {
      stream.close();
    }
    return file;
  }

  /**
   * {@inheritDoc}
   */
  @Override
  public boolean perform(AbstractBuild<?, ?> build, Launcher launcher, BuildListener listener)
      throws InterruptedException, IOException {

    FilePath moduleRoot = build.getModuleRoot();
    this.deleteDebugLog(moduleRoot);
    if (this.needToCopyImage()
        && (!copyImage(listener, moduleRoot) || !copyChanges(listener, moduleRoot))) {
      return false;
    }

    ArgumentListBuilder args = new ArgumentListBuilder();
    args.add(getDescriptor().getVm());
    addVmParametersTo(args);
    args.add(getImageToBuildAgainst(moduleRoot));

    Map<String, String> env = build.getEnvironment(listener);
    File script = this.getStartUpScript();
    try {
      args.add(script);
      return this.startVm(build, launcher, listener, args, env);
    } finally {
      //TODO uncomment
      //if (!script.delete()) {
      //  listener.getLogger().println("could not delete temp file");
      //}
    }
  }

  private void addVmParametersTo(ArgumentListBuilder args) {
    String trimmed = Util.fixEmptyAndTrim(getDescriptor().getParameters());
    if (trimmed != null) {
      for (String each : trimmed.split(" ")) {
        if (each != null && !each.isEmpty()) {
          args.add(each);
        }
      }
    }
  }

  private boolean startVm(AbstractBuild<?, ?> build, Launcher launcher, BuildListener listener,
      ArgumentListBuilder args, Map<String, String> env) throws InterruptedException, IOException {
    FilePath moduleRoot = build.getModuleRoot();
    ScheduledFuture<?> future = null;
    try {
      Proc proc = launcher.launch().cmds(args).envs(env).stdout(listener).pwd(moduleRoot).start();
      FilePath debugLog = this.getDebugLog(moduleRoot);
      if (debugLog != null) {
        Runnable watchdog = new WatdogTask(debugLog, proc, listener.getLogger());
        future = EXECUTOR.scheduleAtFixedRate(watchdog, 500L, 500L, TimeUnit.MILLISECONDS);
      } else {
        // FIXME
        listener.getLogger().println("debug log doesn't exist");
      }
      int r = proc.join();
      // FIXME
      listener.getLogger().println("returned: " + r);
      return r == 0;
    } catch (IOException e) {
      // FIXME
      listener.getLogger().println("cought IOException");
      this.appendDebugLog(moduleRoot, listener);
      Util.displayIOException(e, listener);

      String errorMessage = Messages.pharo_imageBuildFailed();
      e.printStackTrace(listener.fatalError(errorMessage));
      return false;
    } catch (InterruptedException e) {
      // FIXME
      listener.getLogger().println("cought InterruptedException");
      this.appendDebugLog(moduleRoot, listener);
      Thread.currentThread().interrupt();
      throw new InterruptedException();
    } finally {
      if (future != null) {
        future.cancel(true);
      }
    }
  }

  /**
   * {@inheritDoc}
   */
  @Override
  public DescriptorImpl getDescriptor() {
    return DESCRIPTOR;
  }

  /**
   * Descriptor for {@link PharoBuilder}. Used as a singleton.
   * The class is marked as public so that it can be accessed from views.
   *
   * <p>
   * See <tt>views/hudson/plugins/pharo-build/PharoBuilder/*.jelly</tt>
   * for the actual HTML fragment for the configuration screen.
   */
  public static final class DescriptorImpl extends BuildStepDescriptor<Builder> {

    private String vm;

    private String parameters;

    private String beforeCode;

    private String afterCode;

    public DescriptorImpl() {
      super(PharoBuilder.class);
      // hack to work around missing defaults in textarea tag
      this.beforeCode = this.defaultBeforeCode();
      this.afterCode = this.defaultAfterCode();
      load();
    }

    protected DescriptorImpl(Class<? extends PharoBuilder> clazz) {
      super(clazz);
      // hack to work around missing defaults in textarea tag
      this.beforeCode = this.defaultBeforeCode();
      this.afterCode = this.defaultAfterCode();
    }

    /**
     * Performs on-the-fly validation of the form field 'vm'.
     *
     * @param value
     *      This parameter receives the value that the user has typed.
     * @return
     *      Indicates the outcome of the validation. This is sent to the browser.
     */
    public FormValidation doCheckVm(@QueryParameter String value) {
      if (value.isEmpty()) {
        return FormValidation.error(Messages.pharo_vmPathEmpty());
      }
      return FormValidation.ok();
    }

    /**
     * Performs on-the-fly validation of the form field 'vm'.
     *
     * @param value
     *      This parameter receives the value that the user has typed.
     * @return
     *      Indicates the outcome of the validation. This is sent to the browser.
     */
    public FormValidation doCheckVM(@QueryParameter String value) {
      if (value.isEmpty()) {
        return FormValidation.error(Messages.pharo_vmPathEmpty() + "!");
      }
      return FormValidation.ok();
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public boolean isApplicable(@SuppressWarnings("rawtypes") /* broken in superclass */
        Class<? extends AbstractProject> aClass) {
      // indicates that this builder can be used with all kinds of project types
      return true;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public String getDisplayName() {
      return Messages.pharo_displayName();
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public boolean configure(StaplerRequest request, JSONObject formData) throws FormException {
      this.vm = formData.getString("vm");
      this.parameters = formData.getString("parameters");
      this.beforeCode = formData.getString("beforeCode");
      this.afterCode = formData.getString("afterCode");
      // ^Can also use req.bindJSON(this, formData);
      //  (easier when there are many fields; need set* methods for this)
      save();
      return super.configure(request, formData);
    }

    public String getVm() {
      return this.vm;
    }

    public String getParameters() {
      return this.parameters;
    }

    public String getBeforeCode() {
      return this.beforeCode;
    }

    public String getAfterCode() {
      return this.afterCode;
    }

    public String defaultVm() {
      return "squeak";
    }
    public String defaultParamters() {
      return "-nodisplay -nosound";
    }

    public String defaultBeforeCode() {
      return "\"Preparations\"\n"
      + "MCCacheRepository instVarNamed: 'default' put: nil.";
    }

    public String defaultAfterCode() {
      return "\"Clear Author\"\n"
      + "Author reset.\n"
      + "!\n"
      + "\"Clear Monticello Caches\"\n"
      + "MCCacheRepository instVarNamed: 'default' put: nil.\n"
      + "MCFileBasedRepository flushAllCaches.\n"
      + "MCMethodDefinition shutDown.\n"
      + "MCDefinition clearInstances.\n"
      + "!\n"
      + "\"Cleanup Smalltalk\"\n"
      + "Smalltalk flushClassNameCache.\n"
      + "Smalltalk organization removeEmptyCategories.\n"
      + "Smalltalk allClassesAndTraitsDo: [ :each |\n"
      + "    each organization removeEmptyCategories; sortCategories.\n"
      + "    each class organization removeEmptyCategories; sortCategories ].\n"
      + "!\n"
      + "\"Cleanup System Memory\"\n"
      + "Smalltalk garbageCollect.\n"
      + "Symbol compactSymbolTable.\n"
      + "!\n"
      + "\"Save and Quit\"\n"
      + "WorldState addDeferredUIMessage: [\n"
      + "    SmalltalkImage current snapshot: true andQuit: true ].";
    }

  }

  /**
   * A simple task that checks for file. It it's there it kills a given process.
   */
  static final class WatdogTask implements Runnable {

    private final FilePath toWatch;

    private final Proc proc;

    private final PrintStream logger;

    WatdogTask(FilePath toWatch, Proc proc, PrintStream logger) {
      this.logger = logger;
      this.toWatch = toWatch;
      this.proc = proc;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void run() {
      try {
        //FIXME
        this.logger.println("checking: " + this.toWatch.getRemote());
        if (this.toWatch.exists()) {
          //FIXME
          this.logger.println("exists, killing");
          //FIXME kill does a join, blocking the pool
          this.proc.kill();
          this.logger.println("exists, killed");
        }
      } catch (IOException e) {
        //FIXME
        this.logger.println("Watchdog IOException");
        this.logger.print("[ERROR] could not watch: " + this.toWatch.getRemote() + " because " + e.getMessage());
        throw new RuntimeException(e);
      } catch (InterruptedException e) {
        //FIXME
        this.logger.println("Watchdog InterruptedException");
        Thread.currentThread().interrupt();
        return;
      }

    }

  }
}

