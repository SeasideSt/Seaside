/*
 * Copyright (c) 2010 Netcetera AG and others.
 * All rights reserved.
 * This program and the accompanying materials are made available under
 * the terms of the Eclipse Public License v1.0 which accompanies this
 * distribution, and is available at
 *
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 * - Netcetera AG: initial implementation
 */
package st.seaside;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;

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
import net.sf.json.JSONObject;
import st.seaside.OneClickBuilder.DescriptorImpl;


/**
 * {@link Builder} for <a href="http://www.pharo-project.org/">Pharo</a>
 * one click images.
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
public class OneClickBuilder extends Builder {

  // This code was written in an Avro RJ 100

  /**
   * Singleton instance of the global configuration descriptor.
   */
  @Extension
  public static final DescriptorImpl DESCRIPTOR = new DescriptorImpl();

  private static final String SHELL_SCRIPT_PREFIX = "#!/bin/sh\n"
    + "APP=`dirname $0`\n"
    + "EXE=\"$APP/Contents/Linux686\"\n"
    + "RES=\"$APP/Contents/Resources\"\n"
    + "\n"
    + "exec \"$EXE/squeak\" -plugins \"$EXE\" \\\n"
    + "        -encoding utf-8 \\\n"
    + "        -vm-display-X11   \\\n"
    + "        \"$RES/";

  private static final String SHELL_SCRIPT_SUFFIX = ".image\"";

  //TODO use Windows newlines
  private static final String INI_PREFIX = "[Global]\n"
    + "DeferUpdate=1\n"
    + "ShowConsole=0\n"
    + "DynamicConsole=1\n"
    + "ReduceCPUUsage=1\n"
    + "ReduceCPUInBackground=0\n"
    + "3ButtonMouse=0\n"
    + "1ButtonMouse=0\n"
    + "PriorityBoost=1\n"
    + "B3DXUsesOpenGL=1\n"
    + "CaseSensitiveFileMode=0\n"
    + "";

  private final String finalName;
  private final String image;
  private final String macOsIcon;
  private final String windowsIcon;
  private final String windowsSplash;
  private final String macVm;
  private final String unixVm;
  private final String windowsVm;

  //TODO sources?
  //TODO fonts?
  //TODO handle non-existing icons

  @DataBoundConstructor
  public OneClickBuilder(String finalName, String image, String macOsIcon, String windowsIcon, String windowsSplash,
      String macVm, String unixVm, String windowsVm) {
    this.finalName = finalName;
    this.macOsIcon = macOsIcon;
    this.windowsIcon = windowsIcon;
    this.windowsSplash = windowsSplash;
    this.macVm = macVm;
    this.unixVm = unixVm;
    this.windowsVm = windowsVm;
    this.image = image;
  }

  /**
   * {@inheritDoc}
   */
  @Override
  public boolean perform(AbstractBuild<?, ?> build, Launcher launcher, BuildListener listener)
      throws InterruptedException, IOException {
    FilePath moduleRoot = build.getModuleRoot();

    this.createEmptyAppFolder(moduleRoot);
    this.copyVmsToAppFolder(moduleRoot);
    this.copyImageAndChangesToAppFolder(moduleRoot);

    this.renameExeAndIni(moduleRoot, listener.getLogger());
    this.writeStartShellScript(moduleRoot);
    //TODO copy icons
    //TODO create .ini
    //TODO create Info.plist
    //TODO copy splash

    this.zipAppFolder(moduleRoot);

    return true;
  }

  private void createEmptyAppFolder(FilePath moduleRoot) throws IOException, InterruptedException {
    FilePath appFolder = this.getAppFolder(moduleRoot);
    if (appFolder.exists()) {
      appFolder.deleteContents();
    } else {
      appFolder.mkdirs();
    }
  }

  private FilePath getAppFolder(FilePath moduleRoot) {
    return moduleRoot.child(this.finalName + ".app");
  }

  private void copyVmsToAppFolder(FilePath moduleRoot) throws IOException, InterruptedException {
    FilePath appFolder = this.getAppFolder(moduleRoot);
    FilePath macVmPath = this.getMacVmPath(moduleRoot);
    FilePath unixVmPath = this.getUnixVmPath(moduleRoot);
    FilePath windowsVmPath = this.getWindowsVmPath(moduleRoot);

    macVmPath.copyRecursiveTo(appFolder);
    unixVmPath.copyRecursiveTo(appFolder);
    windowsVmPath.copyRecursiveTo(appFolder);
  }

  private void renameExeAndIni(FilePath moduleRoot, PrintStream logger) throws IOException, InterruptedException {
    this.
    renameFileInAppFolderToFinalName(moduleRoot, "exe", logger);
    this.renameFileInAppFolderToFinalName(moduleRoot, "ini", logger);
  }

  private void renameFileInAppFolderToFinalName(FilePath moduleRoot, String suffix, PrintStream logger)
      throws IOException, InterruptedException {
    FilePath appFolder = this.getAppFolder(moduleRoot);
    FilePath[] exes = appFolder.list("*." + suffix);
    if (exes.length == 1) {
      FilePath exe = exes[0];
      FilePath target = exe.getParent().child(this.finalName + "." + suffix);
      exe.renameTo(target);
    } else if (exes.length == 0) {
      logger.println("[INFO] [OneClickBuilder] found more than no ." + suffix + ", not renaming");
    } else {
      logger.println("[INFO] [OneClickBuilder] found more than one ." + suffix + ", not renaming");
    }
  }

  private void copyImageAndChangesToAppFolder(FilePath moduleRoot) throws IOException, InterruptedException {
    FilePath resourcesFolder = this.getAppFolder(moduleRoot).child("Contents").child("Resources");
    FilePath imagePath = this.getImagePath(moduleRoot);
    FilePath changesPath = this.getChangesPath(moduleRoot);

    imagePath.copyTo(resourcesFolder);
    changesPath.copyTo(resourcesFolder);
  }

  private void writeStartShellScript(FilePath moduleRoot) throws IOException, InterruptedException {
    FilePath startShellScript = this.getAppFolder(moduleRoot).child(this.finalName + ".sh");
    String shellScode = SHELL_SCRIPT_PREFIX + this.finalName + SHELL_SCRIPT_SUFFIX;
    startShellScript.write(shellScode, "US-ASCII");
  }

  private FilePath getImagePath(FilePath moduleRoot) {
    return this.getPath(this.image + ".image", moduleRoot);
  }

  private FilePath getChangesPath(FilePath moduleRoot) {
    return this.getPath(this.image + ".changes", moduleRoot);
  }

  private FilePath getMacVmPath(FilePath moduleRoot) {
    return this.getPath(this.macVm, moduleRoot);
  }

  private FilePath getUnixVmPath(FilePath moduleRoot) {
    return this.getPath(this.unixVm, moduleRoot);
  }

  private FilePath getWindowsVmPath(FilePath moduleRoot) {
    return this.getPath(this.windowsVm, moduleRoot);
  }

  private FilePath getPath(String path, FilePath moduleRoot) {
    if (this.isAbsolute(path)) {
      return new FilePath(new File(path));
    } else {
      return moduleRoot.child(path);
    }
  }

  private boolean isAbsolute(String path) {
    return this.isAbsoluteUnixPath(path) || this.isAbsoluteWindowsPath(path);
  }

  private boolean isAbsoluteWindowsPath(String path) {
    return path.length() > 3
      && Character.isLetter(path.charAt(0))
      && path.charAt(1) == ':'
      && path.charAt(2) == '\\';
  }

  private boolean isAbsoluteUnixPath(String path) {
    return path.charAt(0) == '/';
  }

  private void zipAppFolder(FilePath moduleRoot) throws IOException, InterruptedException {
    FilePath appFolder = this.getAppFolder(moduleRoot);
    FilePath zippedAppFolder = moduleRoot.child(this.finalName + ".app.zip");

    OutputStream output = zippedAppFolder.write();
    appFolder.zip(output);
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
   * See <tt>views/hudson/plugins/pharo-build/OneClickBuilder/*.jelly</tt>
   * for the actual HTML fragment for the configuration screen.
   */
  public static final class DescriptorImpl extends BuildStepDescriptor<Builder> {

    private String finalName;
    private String image;
    private String macOsIcon;
    private String windowsIcon;
    private String windowsSplash;
    private String macVm;
    private String unixVm;
    private String windowsVm;

    /**
     * Default constructor, loads the defaults first and then the saved data.
     */
    public DescriptorImpl() {
      super(OneClickBuilder.class);
      load();
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public boolean configure(StaplerRequest request, JSONObject formData) throws FormException {
      this.finalName = formData.getString("finalName");
      this.image = formData.getString("image");
      this.macOsIcon = formData.getString("macOsIcon");
      this.windowsIcon = formData.getString("windowsIcon");
      this.windowsSplash = formData.getString("windowsSplash");
      this.macVm = formData.getString("macVm");
      this.unixVm = formData.getString("unixVm");
      this.windowsVm = formData.getString("windowsVm");
      // ^Can also use req.bindJSON(this, formData);
      //  (easier when there are many fields; need set* methods for this)
      save();
      return super.configure(request, formData);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public boolean isApplicable(@SuppressWarnings("rawtypes") /* broken in superclass */
        Class<? extends AbstractProject> jobType) {
      // indicates that this builder can be used with all kinds of project types
      return true;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public String getDisplayName() {
      return Messages.oneClick_displayName();
    }

    public String getFinalName() {
      return this.finalName;
    }

    public String getImage() {
      return this.image;
    }

    public String getMacOsIcon() {
      return this.macOsIcon;
    }

    public String getWindowsIcon() {
      return this.windowsIcon;
    }

    public String getWindowsSplash() {
      return this.windowsSplash;
    }

    public String getMacVm() {
      return this.macVm;
    }

    public String getUnixVm() {
      return this.unixVm;
    }

    public String getWindowsVm() {
      return this.windowsVm;
    }


  }


}
