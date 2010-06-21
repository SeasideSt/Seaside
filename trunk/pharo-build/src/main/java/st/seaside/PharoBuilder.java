package st.seaside;
import java.io.IOException;
import java.io.PrintStream;
import java.nio.charset.Charset;
import java.util.Map;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.ThreadFactory;
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
import hudson.util.DaemonThreadFactory;
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
 * When a build is performed, the {@link #perform(AbstractBuild, Launcher, BuildListener)} method
 * will be invoked.
 *
 * @author Philippe Marschall
 */
public class PharoBuilder extends Builder {

  /**
   * Singleton instance of the global configuration descriptor.
   */
  @Extension
  public static final DescriptorImpl DESCRIPTOR = new DescriptorImpl();

  private static final ScheduledExecutorService EXECUTOR;

  static {
    // create a demon thread, otherwise we prevent the VM from shutting down
    ThreadFactory threadFactory = new DaemonThreadFactory();
    EXECUTOR = Executors.newSingleThreadScheduledExecutor(threadFactory);
  }

  private final String image;
  private final String script;
  private final String logFile;

  // Fields in config.jelly must match the parameter names in the "DataBoundConstructor"

  /**
   * Constructor invoked byJelly.
   *
   * <p>Fields in config.jelly must match the parameter names in the
   * "DataBoundConstructor".</p>
   *
   * @param image the name of the image, may or may not end with {@literal ".image"},
   *    must not be {@literal null}
   * @param script Smalltalk doit to execute between the before and after code,
   *    may be {@literal null}
   * @param logFile name of the debug log file to watch for, may be {@literal null}
   *    in this case no watching will happen
   */
  @DataBoundConstructor
  public PharoBuilder(String image, String script, String logFile) {
    this.image = stripDotImage(image);
    this.script = script;
    this.logFile = logFile;
  }

  /**
   * Returns the name of the image to build.
   *
   * <p>Needed by jelly.</p>
   *
   * @return the name of the image to build with {@code ".image"} stripped
   */
  public String getImage() {
    return this.image;
  }

  /**
   * Returns the Smalltalk script to execute, between the global before and
   * after scripts.
   *
   * <p>Needed by jelly.</p>
   *
   * @return the Smalltalk script to execute, may be empty for {@code null}
   */
  public String getScript() {
    return this.script;
  }

  /**
   * Returns the name of the debug log to watch for.
   *
   * <p>Needed by jelly.</p>
   *
   * @return the name of the debug log to watch for, may be empty for {@code null}
   */
  public String getFileToWatch() {
    return this.logFile;
  }

  private FilePath getImageFile(FilePath moduleRoot) {
    return moduleRoot.child(this.image + ".image");
  }

  private static String stripDotImage(String s) {
    if (s.endsWith(".image")) {
      return s.substring(0, s.length() - ".image".length());
    } else {
      return s;
    }
  }

  private void deleteDebugLog(FilePath moduleRoot) throws IOException, InterruptedException {
    FilePath debugLog = this.getDebugLog(moduleRoot);
    if (debugLog.exists()) {
      debugLog.delete();
    }
  }

  private FilePath getDebugLog(FilePath moduleRoot) {
    if (this.logFile != null && !this.logFile.isEmpty()) {
      return moduleRoot.child(this.logFile);
    } else {
      return null;
    }
  }

  private String getContentsOfDebugLog(FilePath moduleRoot) throws IOException, InterruptedException {
    FilePath debugLog = this.getDebugLog(moduleRoot);
    if (debugLog != null && debugLog.exists()) {
      return debugLog.readToString();
    } else {
      return null;
    }
  }

  private void appendDebugLog(FilePath moduleRoot, BuildListener listener) throws IOException, InterruptedException {
    String contents = this.getContentsOfDebugLog(moduleRoot);
    if (contents != null) {
      listener.fatalError(contents);
    }
  }

  private FilePath getStartUpScript(FilePath moduleRoot) throws IOException, InterruptedException {
    FilePath script = moduleRoot.child(this.image + ".st");
    // REVIEW not sure what the correct encoding would be
    script.write(this.getStartUpCode(), Charset.defaultCharset().name());
    return script;
  }

  private String getStartUpCode() {
    String code = "";
    String beforeCode = getDescriptor().getBeforeCode();
    if (beforeCode != null && !beforeCode.isEmpty()) {
      code += beforeCode + "\n!\n";
    }
    String buildScript = this.getScript();
    if (buildScript != null && !buildScript.isEmpty()) {
      code += buildScript + "\n!\n";
    }
    String afterCode = getDescriptor().getAfterCode();
    if (afterCode != null && !afterCode.isEmpty()) {
      code += afterCode + "\n!\n";
    }
    return code;
  }

  /**
   * {@inheritDoc}
   */
  @Override
  public boolean perform(AbstractBuild<?, ?> build, Launcher launcher, BuildListener listener)
      throws InterruptedException, IOException {

    FilePath moduleRoot = build.getModuleRoot();
    this.deleteDebugLog(moduleRoot);

    ArgumentListBuilder args = new ArgumentListBuilder();
    args.add(getDescriptor().getVm());
    addVmParametersTo(args);
    args.add(this.getImageFile(moduleRoot));
    args.add(this.getStartUpScript(moduleRoot));

   return this.startVm(build, launcher, listener, args);
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
      ArgumentListBuilder args) throws InterruptedException, IOException {

    FilePath moduleRoot = build.getModuleRoot();
    ScheduledFuture<?> future = null;
    Map<String, String> env = build.getEnvironment(listener);
    try {
      Proc proc = launcher.launch().cmds(args).envs(env).stdout(listener).pwd(moduleRoot).start();
      FilePath debugLog = this.getDebugLog(moduleRoot);
      if (debugLog != null) {
        Runnable watchdog = new WatdogTask(debugLog, proc, listener.getLogger());
        future = EXECUTOR.scheduleAtFixedRate(watchdog, 500L, 500L, TimeUnit.MILLISECONDS);
      }
      int r = proc.join();
      this.appendDebugLog(moduleRoot, listener);
      return r == 0;
    } catch (IOException e) {
      this.appendDebugLog(moduleRoot, listener);
      Util.displayIOException(e, listener);

      String errorMessage = Messages.pharo_imageBuildFailed();
      e.printStackTrace(listener.fatalError(errorMessage));
      return false;
    } catch (InterruptedException e) {
      this.appendDebugLog(moduleRoot, listener);
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

    /**
     * Default constructor, loads the defaults first and then the saved data.
     */
    public DescriptorImpl() {
      super(PharoBuilder.class);
      // hack to work around missing defaults in textarea tag
      this.beforeCode = this.defaultBeforeCode();
      this.afterCode = this.defaultAfterCode();
      load();
    }

    /**
     * Constructor, only loads the defaults and not the saved data.
     *
     * @param clazz the builder class
     */
    protected DescriptorImpl(Class<? extends PharoBuilder> clazz) {
      super(clazz);
      // hack to work around missing defaults in textarea tag
      this.beforeCode = this.defaultBeforeCode();
      this.afterCode = this.defaultAfterCode();
    }

    /**
     * Performs on-the-fly validation of the form field 'image'.
     *
     * @param value
     *      This parameter receives the value that the user has typed.
     * @return
     *      Indicates the outcome of the validation. This is sent to the browser.
     */
    public FormValidation doCheckImage(@QueryParameter String value) {
      if (value.isEmpty()) {
        return FormValidation.error(Messages.pharo_imageEmpty());
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

    /**
     * Returns the default value to display for the VM path in the global configuration
     * of the builder.
     *
     * @return the default value for the VM path
     */
    public String defaultVm() {
      return "squeak";
    }

    /**
     * Returns the default value to display for the VM parameters in the global configuration
     * of the builder.
     *
     * @return the default value for the VM parameters
     */
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
        + "\n"
        + "\"Clear Monticello Caches\"\n"
        + "MCCacheRepository instVarNamed: 'default' put: nil.\n"
        + "MCFileBasedRepository flushAllCaches.\n"
        + "MCMethodDefinition shutDown.\n"
        + "MCDefinition clearInstances.\n"
        + "\n"
        + "\"Cleanup Smalltalk\"\n"
        + "Smalltalk flushClassNameCache.\n"
        + "Smalltalk organization removeEmptyCategories.\n"
        + "Smalltalk allClassesAndTraitsDo: [ :each |\n"
        + "    each organization removeEmptyCategories; sortCategories.\n"
        + "    each class organization removeEmptyCategories; sortCategories ].\n"
        + "\n"
        + "\"Cleanup System Memory\"\n"
        + "Smalltalk garbageCollect.\n"
        + "Symbol compactSymbolTable.\n"
        + "\n"
        + "\"Save and Quit\"\n"
        + "WorldState addDeferredUIMessage: [\n"
        + "    SmalltalkImage current snapshot: true andQuit: true ].";
    }

  }

  /**
   * A simple task that checks for file. It it's there it kills a given process.
   *
   * <p>To execute it repeatedly you probably want to wrap it in a {@link ScheduledFuture}
   * and  {@link ScheduledFuture#cancel(boolean)} it when it is no longer needed.</p>
   */
  static final class WatdogTask implements Runnable {

    private final FilePath toWatch;

    private final Proc proc;

    private final PrintStream logger;

    /**
     * Constructor.
     *
     * @param toWatch the file to watch for,
     *    must not be {@literal null}
     * @param proc the process to kill, {@link Proc#kill()} will be invoked on
     *   it from a different thread, must not be {@literal null}
     * @param logger the logger to use for info and error logging,
     *   must not be {@literal null}
     */
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
        if (this.toWatch.exists()) {
          this.logger.println("[INFO] found " + this.toWatch.getRemote() + ", killing");
          this.proc.kill();
        }
      } catch (IOException e) {
        this.logger.print("[ERROR] could not watch: " + this.toWatch.getRemote() + " because " + e.getMessage());
        throw new RuntimeException(e);
      } catch (InterruptedException e) {
        Thread.currentThread().interrupt();
        return;
      }

    }

  }
}

