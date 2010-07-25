package st.seaside;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintStream;
import java.io.UnsupportedEncodingException;
import java.io.Writer;

import org.apache.commons.lang.StringUtils;
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

import static st.seaside.PharoUtils.stripDotImage;


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

  private static final String CRLF;
  private static final String CR;

  static {
    try {
      CRLF = new String(new byte[] {13, 10}, "US-ASCII");
      CR = new String(new byte[] {13}, "US-ASCII");
    } catch (UnsupportedEncodingException e) {
      throw new RuntimeException("US-ASCII not supported, shouldn't happen");
    }
  }


  /**
   * Singleton instance of the global configuration descriptor.
   */
  @Extension
  public static final DescriptorImpl DESCRIPTOR = new DescriptorImpl();

  private static final String[] SHELL_SCRIPT_PREFIXES = new String[] {
    "#!/bin/sh",
    "",
    "# path",
    "ROOT=`dirname $0`",
    "BASE=\"$ROOT/Contents/Linux\"",
    "",
    "# execute",
    "exec \"$BASE/squeakvm\" \\",
    "        -plugins \"$BASE\" ",
    "        -encoding utf-8 ",
    "        -vm-display-X11 "
  };

  private static final String[] INI_PREFIXES = new String[] {
    "[Global]",
    "DeferUpdate=1",
    "ShowConsole=0",
    "DynamicConsole=1",
    "ReduceCPUUsage=1",
    "ReduceCPUInBackground=0",
    "3ButtonMouse=0",
    "1ButtonMouse=0",
    "PriorityBoost=1",
    "B3DXUsesOpenGL=1",
    "CaseSensitiveFileMode=0"
  };

  private static final String INFO_PLIST_1 = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
    + "<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n"
    + "<plist version=\"1.0\">\n"
    + "<dict>\n"
    + "        <key>CFBundleDevelopmentRegion</key>\n"
    + "        <string>English</string>\n"
    + "        <key>CFBundleDocumentTypes</key>\n"
    + "        <array>\n"
    + "                <dict>\n"
    + "                        <key>CFBundleTypeExtensions</key>\n"
    + "                        <array>\n"
    + "                                <string>image</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeIconFile</key>\n"
    + "                        <string>SqueakImage.icns</string>\n"
    + "                        <key>CFBundleTypeName</key>\n"
    + "                        <string>Squeak Image File</string>\n"
    + "                        <key>CFBundleTypeOSTypes</key>\n"
    + "                        <array>\n"
    + "                                <string>STim</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeRole</key>\n"
    + "                        <string>Editor</string>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>CFBundleTypeExtensions</key>\n"
    + "                        <array>\n"
    + "                                <string>sources</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeIconFile</key>\n"
    + "                        <string>SqueakSources.icns</string>\n"
    + "                        <key>CFBundleTypeName</key>\n"
    + "                        <string>Squeak Sources File</string>\n"
    + "                        <key>CFBundleTypeOSTypes</key>\n"
    + "                        <array>\n"
    + "                                <string>STso</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeRole</key>\n"
    + "                        <string>Editor</string>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>CFBundleTypeExtensions</key>\n"
    + "                        <array>\n"
    + "                                <string>changes</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeIconFile</key>\n"
    + "                        <string>SqueakChanges.icns</string>\n"
    + "                        <key>CFBundleTypeName</key>\n"
    + "                        <string>Squeak Changes File</string>\n"
    + "                        <key>CFBundleTypeOSTypes</key>\n"
    + "                        <array>\n"
    + "                                <string>STch</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeRole</key>\n"
    + "                        <string>Editor</string>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>CFBundleTypeExtensions</key>\n"
    + "                        <array>\n"
    + "                                <string>sobj</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeIconFile</key>\n"
    + "                        <string>SqueakScript.icns</string>\n"
    + "                        <key>CFBundleTypeName</key>\n"
    + "                        <string>Squeak Script File</string>\n"
    + "                        <key>CFBundleTypeOSTypes</key>\n"
    + "                        <array>\n"
    + "                                <string>SOBJ</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeRole</key>\n"
    + "                        <string>Editor</string>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>CFBundleTypeExtensions</key>\n"
    + "                        <array>\n"
    + "                                <string>pr</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeIconFile</key>\n"
    + "                        <string>SqueakProject.icns</string>\n"
    + "                        <key>CFBundleTypeName</key>\n"
    + "                        <string>Squeak Project File</string>\n"
    + "                        <key>CFBundleTypeOSTypes</key>\n"
    + "                        <array>\n"
    + "                                <string>STpr</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeRole</key>\n"
    + "                        <string>Editor</string>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>CFBundleTypeName</key>\n"
    + "                        <string>JPEG</string>\n"
    + "                        <key>CFBundleTypeOSTypes</key>\n"
    + "                        <array>\n"
    + "                                <string>JPEG</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeRole</key>\n"
    + "                        <string>Viewer</string>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>CFBundleTypeName</key>\n"
    + "                        <string>TEXT</string>\n"
    + "                        <key>CFBundleTypeOSTypes</key>\n"
    + "                        <array>\n"
    + "                                <string>TEXT</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeRole</key>\n"
    + "                        <string>Viewer</string>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>CFBundleTypeName</key>\n"
    + "                        <string>ttro</string>\n"
    + "                        <key>CFBundleTypeOSTypes</key>\n"
    + "                        <array>\n"
    + "                                <string>ttro</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeRole</key>\n"
    + "                        <string>Viewer</string>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>CFBundleTypeName</key>\n"
    + "                        <string>HTML</string>\n"
    + "                        <key>CFBundleTypeOSTypes</key>\n"
    + "                        <array>\n"
    + "                                <string>HTML</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeRole</key>\n"
    + "                        <string>Viewer</string>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>CFBundleTypeName</key>\n"
    + "                        <string>RTF </string>\n"
    + "                        <key>CFBundleTypeOSTypes</key>\n"
    + "                        <array>\n"
    + "                                <string>RTF</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeRole</key>\n"
    + "                        <string>Viewer</string>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>CFBundleTypeName</key>\n"
    + "                        <string>TIFF </string>\n"
    + "                        <key>CFBundleTypeOSTypes</key>\n"
    + "                        <array>\n"
    + "                                <string>TIFF</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeRole</key>\n"
    + "                        <string>Viewer</string>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>CFBundleTypeName</key>\n"
    + "                        <string>PICT </string>\n"
    + "                        <key>CFBundleTypeOSTypes</key>\n"
    + "                        <array>\n"
    + "                                <string>PICT</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeRole</key>\n"
    + "                        <string>Viewer</string>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>CFBundleTypeName</key>\n"
    + "                        <string>URL  </string>\n"
    + "                        <key>CFBundleTypeOSTypes</key>\n"
    + "                        <array>\n"
    + "                                <string>URL</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeRole</key>\n"
    + "                        <string>Viewer</string>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>CFBundleTypeName</key>\n"
    + "                        <string>ZIP </string>\n"
    + "                        <key>CFBundleTypeOSTypes</key>\n"
    + "                        <array>\n"
    + "                                <string>ZIP</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeRole</key>\n"
    + "                        <string>Viewer</string>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>CFBundleTypeName</key>\n"
    + "                        <string>zip </string>\n"
    + "                        <key>CFBundleTypeOSTypes</key>\n"
    + "                        <array>\n"
    + "                                <string>zip</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeRole</key>\n"
    + "                        <string>Viewer</string>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>CFBundleTypeName</key>\n"
    + "                        <string>BINA</string>\n"
    + "                        <key>CFBundleTypeOSTypes</key>\n"
    + "                        <array>\n"
    + "                                <string>BINA</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeRole</key>\n"
    + "                        <string>Viewer</string>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>CFBundleTypeName</key>\n"
    + "                        <string>GIFf</string>\n"
    + "                        <key>CFBundleTypeOSTypes</key>\n"
    + "                        <array>\n"
    + "                                <string>GIFf</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeRole</key>\n"
    + "                        <string>Viewer</string>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>CFBundleTypeName</key>\n"
    + "                        <string>PNGf</string>\n"
    + "                        <key>CFBundleTypeOSTypes</key>\n"
    + "                        <array>\n"
    + "                                <string>PNGf</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeRole</key>\n"
    + "                        <string>Viewer</string>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>CFBundleTypeName</key>\n"
    + "                        <string>MP3 </string>\n"
    + "                        <key>CFBundleTypeOSTypes</key>\n"
    + "                        <array>\n"
    + "                                <string>MP3</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeRole</key>\n"
    + "                        <string>Viewer</string>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>CFBundleTypeName</key>\n"
    + "                        <string>MP3!</string>\n"
    + "                        <key>CFBundleTypeOSTypes</key>\n"
    + "                        <array>\n"
    + "                                <string>MP3!</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeRole</key>\n"
    + "                        <string>Viewer</string>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>CFBundleTypeName</key>\n"
    + "                        <string>MP3U</string>\n"
    + "                        <key>CFBundleTypeOSTypes</key>\n"
    + "                        <array>\n"
    + "                                <string>MP3U</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeRole</key>\n"
    + "                        <string>Viewer</string>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>CFBundleTypeName</key>\n"
    + "                        <string>MPEG</string>\n"
    + "                        <key>CFBundleTypeOSTypes</key>\n"
    + "                        <array>\n"
    + "                                <string>MPEG</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeRole</key>\n"
    + "                        <string>Viewer</string>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>CFBundleTypeName</key>\n"
    + "                        <string>mp3!</string>\n"
    + "                        <key>CFBundleTypeOSTypes</key>\n"
    + "                        <array>\n"
    + "                                <string>mp3!</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeRole</key>\n"
    + "                        <string>Viewer</string>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>CFBundleTypeName</key>\n"
    + "                        <string>MPG2</string>\n"
    + "                        <key>CFBundleTypeOSTypes</key>\n"
    + "                        <array>\n"
    + "                                <string>MPG2</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeRole</key>\n"
    + "                        <string>Viewer</string>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>CFBundleTypeName</key>\n"
    + "                        <string>MPG3</string>\n"
    + "                        <key>CFBundleTypeOSTypes</key>\n"
    + "                        <array>\n"
    + "                                <string>MPG3</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeRole</key>\n"
    + "                        <string>Viewer</string>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>CFBundleTypeName</key>\n"
    + "                        <string>MPG </string>\n"
    + "                        <key>CFBundleTypeOSTypes</key>\n"
    + "                        <array>\n"
    + "                                <string>MPG</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeRole</key>\n"
    + "                        <string>Viewer</string>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>CFBundleTypeName</key>\n"
    + "                        <string>Mp3</string>\n"
    + "                        <key>CFBundleTypeOSTypes</key>\n"
    + "                        <array>\n"
    + "                                <string>mp3</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeRole</key>\n"
    + "                        <string>Viewer</string>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>CFBundleTypeName</key>\n"
    + "                        <string>M3U</string>\n"
    + "                        <key>CFBundleTypeOSTypes</key>\n"
    + "                        <array>\n"
    + "                                <string>M3U</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeRole</key>\n"
    + "                        <string>Viewer</string>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>CFBundleTypeName</key>\n"
    + "                        <string>SRCS</string>\n"
    + "                        <key>CFBundleTypeOSTypes</key>\n"
    + "                        <array>\n"
    + "                                <string>SRCS</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeRole</key>\n"
    + "                        <string>Viewer</string>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>CFBundleTypeName</key>\n"
    + "                        <string>Chng</string>\n"
    + "                        <key>CFBundleTypeOSTypes</key>\n"
    + "                        <array>\n"
    + "                                <string>Chng</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeRole</key>\n"
    + "                        <string>Viewer</string>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>CFBundleTypeName</key>\n"
    + "                        <string>HPS5</string>\n"
    + "                        <key>CFBundleTypeOSTypes</key>\n"
    + "                        <array>\n"
    + "                                <string>HPS5</string>\n"
    + "                        </array>\n"
    + "                        <key>CFBundleTypeRole</key>\n"
    + "                        <string>Viewer</string>\n"
    + "                </dict>\n"
    + "        </array>\n"
    + "        <key>CFBundleExecutable</key>\n"
    + "        <string>Squeak VM Opt</string>\n"
    + "        <key>CFBundleGetInfoString</key>\n"
    + "        <string>Squeak VM 4.2.4b1 http://www.squeak.org</string>\n"
    + "        <key>CFBundleIconFile</key>\n"
    + "        <string>";

  private static final String INFO_PLIST_2 = "</string>\n"
    + "        <key>CFBundleIdentifier</key>\n"
    + "        <string>org.squeak.Squeak</string>\n"
    + "        <key>CFBundleInfoDictionaryVersion</key>\n"
    + "        <string>6.0</string>\n"
    + "        <key>CFBundleName</key>\n"
    + "        <string>";

  private static final String INFO_PLIST_3 = "</string>\n"
    + "        <key>CFBundlePackageType</key>\n"
    + "        <string>APPL</string>\n"
    + "        <key>CFBundleShortVersionString</key>\n"
    + "        <string>Squeak VM 4.2.4b1</string>\n"
    + "        <key>CFBundleSignature</key>\n"
    + "        <string>FAST</string>\n"
    + "        <key>CFBundleVersion</key>\n"
    + "        <string>4.2.4b1</string>\n"
    + "        <key>CGDisableCoalescedUpdates</key>\n"
    + "        <true/>\n"
    + "        <key>LSBackgroundOnly</key>\n"
    + "        <false/>\n"
    + "        <key>NSServices</key>\n"
    + "        <array>\n"
    + "                <dict>\n"
    + "                        <key>NSMenuItem</key>\n"
    + "                        <dict>\n"
    + "                                <key>default</key>\n"
    + "                                <string>Squeak DoIt</string>\n"
    + "                        </dict>\n"
    + "                        <key>NSMessage</key>\n"
    + "                        <string>doitandreturn</string>\n"
    + "                        <key>NSPortName</key>\n"
    + "                        <string>Squeak</string>\n"
    + "                        <key>NSReturnTypes</key>\n"
    + "                        <array>\n"
    + "                                <string>NSStringPboardType</string>\n"
    + "                        </array>\n"
    + "                        <key>NSSendTypes</key>\n"
    + "                        <array>\n"
    + "                                <string>NSStringPboardType</string>\n"
    + "                        </array>\n"
    + "                </dict>\n"
    + "        </array>\n"
    + "        <key>SqueakBrowserMouseCmdButton1</key>\n"
    + "        <integer>3</integer>\n"
    + "        <key>SqueakBrowserMouseCmdButton2</key>\n"
    + "        <integer>3</integer>\n"
    + "        <key>SqueakBrowserMouseCmdButton3</key>\n"
    + "        <integer>2</integer>\n"
    + "        <key>SqueakBrowserMouseControlButton1</key>\n"
    + "        <integer>1</integer>\n"
    + "        <key>SqueakBrowserMouseControlButton2</key>\n"
    + "        <integer>3</integer>\n"
    + "        <key>SqueakBrowserMouseControlButton3</key>\n"
    + "        <integer>2</integer>\n"
    + "        <key>SqueakBrowserMouseNoneButton1</key>\n"
    + "        <integer>1</integer>\n"
    + "        <key>SqueakBrowserMouseNoneButton2</key>\n"
    + "        <integer>3</integer>\n"
    + "        <key>SqueakBrowserMouseNoneButton3</key>\n"
    + "        <integer>2</integer>\n"
    + "        <key>SqueakBrowserMouseOptionButton1</key>\n"
    + "        <integer>2</integer>\n"
    + "        <key>SqueakBrowserMouseOptionButton2</key>\n"
    + "        <integer>3</integer>\n"
    + "        <key>SqueakBrowserMouseOptionButton3</key>\n"
    + "        <integer>2</integer>\n"
    + "        <key>SqueakDebug</key>\n"
    + "        <integer>0</integer>\n"
    + "        <key>SqueakEncodingType</key>\n"
    + "        <string>UTF-8</string>\n"
    + "        <key>SqueakExplicitWindowOpenNeeded</key>\n"
    + "        <false/>\n"
    + "        <key>SqueakFloatingWindowGetsFocus</key>\n"
    + "        <true/>\n"
    + "        <key>SqueakImageName</key>\n"
    + "        <string>";

  private static final String INFO_PLIST_4 = "</string>\n"
    + "        <key>SqueakMaxHeapSize</key>\n"
    + "        <integer>536870912</integer>\n"
    + "        <key>SqueakMouseCmdButton1</key>\n"
    + "        <integer>3</integer>\n"
    + "        <key>SqueakMouseCmdButton2</key>\n"
    + "        <integer>3</integer>\n"
    + "        <key>SqueakMouseCmdButton3</key>\n"
    + "        <integer>2</integer>\n"
    + "        <key>SqueakMouseControlButton1</key>\n"
    + "        <integer>1</integer>\n"
    + "        <key>SqueakMouseControlButton2</key>\n"
    + "        <integer>3</integer>\n"
    + "        <key>SqueakMouseControlButton3</key>\n"
    + "        <integer>2</integer>\n"
    + "        <key>SqueakMouseNoneButton1</key>\n"
    + "        <integer>1</integer>\n"
    + "        <key>SqueakMouseNoneButton2</key>\n"
    + "        <integer>3</integer>\n"
    + "        <key>SqueakMouseNoneButton3</key>\n"
    + "        <integer>2</integer>\n"
    + "        <key>SqueakMouseOptionButton1</key>\n"
    + "        <integer>2</integer>\n"
    + "        <key>SqueakMouseOptionButton2</key>\n"
    + "        <integer>3</integer>\n"
    + "        <key>SqueakMouseOptionButton3</key>\n"
    + "        <integer>2</integer>\n"
    + "        <key>SqueakPluginsBuiltInOrLocalOnly</key>\n"
    + "        <true/>\n"
    + "        <key>SqueakQuitOnQuitAppleEvent</key>\n"
    + "        <false/>\n"
    + "        <key>SqueakResourceDirectory</key>\n"
    + "        <string>./</string>\n"
    + "        <key>SqueakTrustedDirectory</key>\n"
    + "        <string>/foobar/tooBar/forSqueak/bogus/</string>\n"
    + "        <key>SqueakUIFlushPrimaryDeferNMilliseconds</key>\n"
    + "        <integer>20</integer>\n"
    + "        <key>SqueakUIFlushSecondaryCheckForPossibleNeedEveryNMilliseconds</key>\n"
    + "        <integer>20</integer>\n"
    + "        <key>SqueakUIFlushSecondaryCleanupDelayMilliseconds</key>\n"
    + "        <integer>25</integer>\n"
    + "        <key>SqueakUIFlushUseHighPercisionClock</key>\n"
    + "        <true/>\n"
    + "        <key>SqueakUnTrustedDirectory</key>\n"
    + "        <string>~/Library/Preferences/Squeak/Internet/My Squeak/</string>\n"
    + "        <key>SqueakUseFileMappedMMAP</key>\n"
    + "        <false/>\n"
    + "        <key>SqueakWindowAttribute</key>\n"
    + "        <data>\n"
    + "        ggAAHg==\n"
    + "        </data>\n"
    + "        <key>SqueakWindowHasTitle</key>\n"
    + "        <true/>\n"
    + "        <key>SqueakWindowType</key>\n"
    + "        <integer>6</integer>\n"
    + "        <key>UTExportedTypeDeclarations</key>\n"
    + "        <array>\n"
    + "                <dict>\n"
    + "                        <key>UTTypeConformsTo</key>\n"
    + "                        <array>\n"
    + "                                <string>public.data</string>\n"
    + "                        </array>\n"
    + "                        <key>UTTypeDescription</key>\n"
    + "                        <string>Squeak Image File</string>\n"
    + "                        <key>UTTypeIdentifier</key>\n"
    + "                        <string>org.squeak.image</string>\n"
    + "                        <key>UTTypeTagSpecification</key>\n"
    + "                        <dict>\n"
    + "                                <key>com.apple.ostype</key>\n"
    + "                                <string>STim</string>\n"
    + "                                <key>public.filename-extension</key>\n"
    + "                                <array>\n"
    + "                                        <string>image</string>\n"
    + "                                </array>\n"
    + "                                <key>public.mime-type</key>\n"
    + "                                <string>application/squeak-image</string>\n"
    + "                        </dict>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>UTTypeConformsTo</key>\n"
    + "                        <array>\n"
    + "                                <string>public.utf8-plain-text</string>\n"
    + "                        </array>\n"
    + "                        <key>UTTypeDescription</key>\n"
    + "                        <string>Squeak Sources File</string>\n"
    + "                        <key>UTTypeIdentifier</key>\n"
    + "                        <string>org.squeak.sources</string>\n"
    + "                        <key>UTTypeTagSpecification</key>\n"
    + "                        <dict>\n"
    + "                                <key>com.apple.ostype</key>\n"
    + "                                <string>STso</string>\n"
    + "                                <key>public.filename-extension</key>\n"
    + "                                <array>\n"
    + "                                        <string>sources</string>\n"
    + "                                </array>\n"
    + "                                <key>public.mime-type</key>\n"
    + "                                <string>application/squeak-sources</string>\n"
    + "                        </dict>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>UTTypeConformsTo</key>\n"
    + "                        <array>\n"
    + "                                <string>public.utf8-plain-text</string>\n"
    + "                        </array>\n"
    + "                        <key>UTTypeDescription</key>\n"
    + "                        <string>Squeak Changes File</string>\n"
    + "                        <key>UTTypeIdentifier</key>\n"
    + "                        <string>org.squeak.changes</string>\n"
    + "                        <key>UTTypeTagSpecification</key>\n"
    + "                        <dict>\n"
    + "                                <key>com.apple.ostype</key>\n"
    + "                                <string>STch</string>\n"
    + "                                <key>public.filename-extension</key>\n"
    + "                                <array>\n"
    + "                                        <string>changes</string>\n"
    + "                                </array>\n"
    + "                                <key>public.mime-type</key>\n"
    + "                                <string>application/squeak-changes</string>\n"
    + "                        </dict>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>UTTypeConformsTo</key>\n"
    + "                        <array>\n"
    + "                                <string>public.data</string>\n"
    + "                        </array>\n"
    + "                        <key>UTTypeDescription</key>\n"
    + "                        <string>Squeak Script File</string>\n"
    + "                        <key>UTTypeIdentifier</key>\n"
    + "                        <string>org.squeak.script</string>\n"
    + "                        <key>UTTypeTagSpecification</key>\n"
    + "                        <dict>\n"
    + "                                <key>com.apple.ostype</key>\n"
    + "                                <string>SOBJ</string>\n"
    + "                                <key>public.filename-extension</key>\n"
    + "                                <array>\n"
    + "                                        <string>sobj</string>\n"
    + "                                </array>\n"
    + "                                <key>public.mime-type</key>\n"
    + "                                <string>application/squeak-script</string>\n"
    + "                        </dict>\n"
    + "                </dict>\n"
    + "                <dict>\n"
    + "                        <key>UTTypeConformsTo</key>\n"
    + "                        <array>\n"
    + "                                <string>public.data</string>\n"
    + "                        </array>\n"
    + "                        <key>UTTypeDescription</key>\n"
    + "                        <string>Squeak Project File</string>\n"
    + "                        <key>UTTypeIdentifier</key>\n"
    + "                        <string>org.squeak.project</string>\n"
    + "                        <key>UTTypeTagSpecification</key>\n"
    + "                        <dict>\n"
    + "                                <key>com.apple.ostype</key>\n"
    + "                                <string>STpr</string>\n"
    + "                                <key>public.filename-extension</key>\n"
    + "                                <array>\n"
    + "                                        <string>pr</string>\n"
    + "                                </array>\n"
    + "                                <key>public.mime-type</key>\n"
    + "                                <string>application/x-squeak-project</string>\n"
    + "                        </dict>\n"
    + "                </dict>\n"
    + "        </array>\n"
    + "</dict>\n"
    + "</plist>\n"
    + "";

  private final String finalName;
  private final String title;
  private final String image;
  private final String macOsIcon;
  private final String windowsIcon;
  private final String windowsSplash;
  private final String macVm;
  private final String unixVm;
  private final String windowsVm;

  //TODO Title?
  //TODO fonts?

  @DataBoundConstructor
  public OneClickBuilder(String finalName, String title, String image,  String macOsIcon, String windowsIcon,
      String windowsSplash, String macVm, String unixVm, String windowsVm) {
    this.finalName = finalName;
    this.title = title;
    this.macOsIcon = macOsIcon;
    this.windowsIcon = windowsIcon;
    this.windowsSplash = windowsSplash;
    this.macVm = macVm;
    this.unixVm = unixVm;
    this.windowsVm = windowsVm;
    this.image = stripDotImage(image);
  }

  /**
   * {@inheritDoc}
   */
  @Override
  public boolean perform(AbstractBuild<?, ?> build, Launcher launcher, BuildListener listener)
  throws InterruptedException, IOException {
    try {
      FilePath moduleRoot = build.getModuleRoot();
      PrintStream logger = listener.getLogger();

      this.createEmptyAppFolder(moduleRoot);
      this.copyVmsToAppFolder(moduleRoot, logger);
      this.copyImageAndChangesToAppFolder(moduleRoot);
      this.copySources(moduleRoot, logger);
      this.copyMacOsIcon(moduleRoot);
      this.copyWindowsSplash(moduleRoot);

      this.renameExeAndIni(moduleRoot, logger);
      this.writeInfoPlist(moduleRoot);
      this.writeStartShellScript(moduleRoot);
      this.writeWindowsIni(moduleRoot);
      //TODO copy windows icon

      this.zipAppFolder(moduleRoot);

      return true;
    } catch (BuildFailedException e) {
      return false;
    }
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

  private FilePath getResourcesFolder(FilePath moduleRoot) {
    FilePath appFolder = this.getAppFolder(moduleRoot);
    return appFolder.child("Contents").child("Resources");
  }

  private void copyVmsToAppFolder(FilePath moduleRoot, PrintStream logger) throws IOException, InterruptedException {
    FilePath appFolder = this.getAppFolder(moduleRoot);
    FilePath macVmPath = this.getMacVmPath(moduleRoot);
    FilePath unixVmPath = this.getUnixVmPath(moduleRoot, logger);
    FilePath windowsVmPath = this.getWindowsVmPath(moduleRoot);

    macVmPath.copyRecursiveTo(appFolder);
    unixVmPath.copyRecursiveTo(appFolder.child("Contents").child("Linux"));
    windowsVmPath.copyRecursiveTo(appFolder);

    FilePath splashBmp = appFolder.child("splash.bmp");
    if (splashBmp.exists()) {
      splashBmp.delete();
    }

    // fix file permissions
    appFolder.child("Contents").child("Linux").child("squeakvm").chmod(0544);
    appFolder.child("Contents").child("MacOS").child("Squeak VM Opt").chmod(0544);
  }

  private void copySources(FilePath moduleRoot, PrintStream logger) throws IOException, InterruptedException {
    FilePath target = this.getResourcesFolder(moduleRoot);
    FilePath sourcesFilePath = this.getSourcesFilePath(moduleRoot, logger);
    sourcesFilePath.copyTo(target.child(sourcesFilePath.getName()));
  }

  private void renameExeAndIni(FilePath moduleRoot, PrintStream logger) throws IOException, InterruptedException {
    this.renameFileInAppFolderToFinalName(moduleRoot, "exe", logger);
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
      logInfo(logger, "found more than no ." + suffix + ", not renaming");
    } else {
      logInfo(logger, "found more than one ." + suffix + ", not renaming");
    }
  }

  private static void logInfo(PrintStream logger, String message) {
    logger.print("[INFO] [OneClickBuilder] ");
    logger.println(message);
  }

  private static void logError(PrintStream logger, String message) {
    logger.print("[ERROR] [OneClickBuilder] ");
    logger.println(message);
  }

  private void copyImageAndChangesToAppFolder(FilePath moduleRoot) throws IOException, InterruptedException {
    FilePath resourcesFolder = this.getResourcesFolder(moduleRoot);
    FilePath imagePath = this.getImagePath(moduleRoot);
    FilePath changesPath = this.getChangesPath(moduleRoot);

    imagePath.copyTo(resourcesFolder.child(this.finalName + ".image"));
    changesPath.copyTo(resourcesFolder.child(this.finalName + ".changes"));
  }

  private void copyWindowsSplash(FilePath moduleRoot) throws IOException, InterruptedException {
    if (StringUtils.isEmpty(this.windowsSplash)) {
      return;
    }

    FilePath target = this.getAppFolder(moduleRoot);
    FilePath windowsSplashPath = this.getWindowsSplashPath(moduleRoot);
    windowsSplashPath.copyTo(target.child(windowsSplashPath.getName()));
  }

  private void copyMacOsIcon(FilePath moduleRoot) throws IOException, InterruptedException {
    if (StringUtils.isEmpty(this.macOsIcon)) {
      return;
    }

    FilePath target = this.getResourcesFolder(moduleRoot);
    FilePath macOsIconPath = this.getMacOsIconPath(moduleRoot);
    macOsIconPath.copyTo(target.child(macOsIconPath.getName()));
  }

  private void writeWindowsIni(FilePath moduleRoot) throws IOException, InterruptedException {
    FilePath appFolder = this.getAppFolder(moduleRoot);

    // delete all inis
    FilePath[] inis = appFolder.list("*.ini");
    for (FilePath ini : inis) {
      ini.delete();
    }

    FilePath ini = appFolder.child(this.finalName + ".ini");
    OutputStream stream = ini.write();
    try {
      //TODO find out .ini encoding
      Writer writer = new OutputStreamWriter(stream, "US-ASCII");
      for (String line : INI_PREFIXES) {
        writer.write(line);
        writer.write(CRLF);
      }

      // Window Title
      if (!StringUtils.isEmpty(this.title)) {
        writer.write("WindowTitle=");
        writer.write(this.title);
        writer.write(CRLF);

        writer.write("SplashTitle=");
        writer.write(this.title);
        writer.write(CRLF);
      }

      // Image File
      writer.write("ImageFile=Contents\\Resources\\");
      writer.write(this.finalName);
      writer.write(".image");
      writer.write(CRLF);

      if (StringUtils.isNotEmpty(this.windowsSplash)) {
        writer.write("SplashScreen=");
        writer.write(this.getWindowsSplashPath(moduleRoot).getName());
        writer.write(CRLF);
      }
      writer.flush();
    } finally {
      stream.close();
    }
  }

  private void writeInfoPlist(FilePath moduleRoot) throws IOException, InterruptedException {
    FilePath infoPlist = this.getAppFolder(moduleRoot).child("Contents").child("Info.plist");
    OutputStream stream = infoPlist.write();
    try {
      Writer writer = new OutputStreamWriter(stream, "utf-8");
      writer.write(INFO_PLIST_1);
      if (StringUtils.isEmpty(this.macOsIcon)) {
        writer.write("Squeak.icns");
      } else {
        writer.write(this.getMacOsIconPath(moduleRoot).getName());
      }
      writer.write(INFO_PLIST_2);
      if (StringUtils.isEmpty(this.title)) {
        writer.write("Squeak VM");
      } else {
        writer.write(this.title);
      }
      writer.write(INFO_PLIST_3);
      writer.write(this.finalName);
      writer.write(".image");
      writer.write(INFO_PLIST_4);
      writer.flush();
    } finally {
      stream.close();
    }

  }

  private void writeStartShellScript(FilePath moduleRoot) throws IOException, InterruptedException {
    FilePath startShellScript = this.getAppFolder(moduleRoot).child(this.finalName + ".sh");
    OutputStream stream = startShellScript.write();
    try {
      Writer writer = new OutputStreamWriter(stream, "US-ASCII");
      for (String line : SHELL_SCRIPT_PREFIXES) {
        writer.write(line);
        writer.write(CR);
      }
      writer.write("        \"$ROOT/Contents/Resources/");
      writer.write(this.finalName);
      writer.write(".image\"");
      writer.write(CR);
      writer.flush();
    } finally {
      stream.close();
    }

    // make executalbe
    startShellScript.chmod(0544);
  }

  private FilePath getImagePath(FilePath moduleRoot) {
    return this.getPath(this.image + ".image", moduleRoot);
  }

  private FilePath getChangesPath(FilePath moduleRoot) {
    return this.getPath(this.image + ".changes", moduleRoot);
  }

  private FilePath getMacOsIconPath(FilePath moduleRoot) {
    return this.getPath(this.macOsIcon, moduleRoot);
  }

  private FilePath getWindowsSplashPath(FilePath moduleRoot) {
    return this.getPath(this.windowsSplash, moduleRoot);
  }

  private FilePath getMacVmPath(FilePath moduleRoot) {
    return this.getPath(this.macVm, moduleRoot);
  }

  private FilePath getUnixVmPath(FilePath moduleRoot, PrintStream logger) throws IOException, InterruptedException {
    FilePath unixVmPath = this.getPath(this.unixVm, moduleRoot);
    if (unixVmPath.child("squeakvm").exists()) {
      return unixVmPath;
    }
    unixVmPath = unixVmPath.child("lib").child("squeak");
    for (FilePath subdirectory : unixVmPath.listDirectories()) {
      if (subdirectory.child("squeakvm").exists()) {
        return subdirectory;
      }
    }

    logError(logger, "unix vm directory structure does not match expectations");
    throw new BuildFailedException();
  }

  private FilePath getWindowsVmPath(FilePath moduleRoot) {
    return this.getPath(this.windowsVm, moduleRoot);
  }

  private FilePath getSourcesFilePath(FilePath moduleRoot, PrintStream logger)
  throws IOException, InterruptedException {
    FilePath imagePath = this.getImagePath(moduleRoot);
    FilePath[] files = imagePath.getParent().list("*.sources");
    if (files.length == 1) {
      return files[0];
    } else if (files.length == 0) {
      logError(logger, "found no .sources in image folder, aborting");
      throw new BuildFailedException();
    } else {
      logError(logger, "found more than .sources in image folder, aborting");
      throw new BuildFailedException();
    }
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

    OutputStream stream = zippedAppFolder.write();
    appFolder.zip(stream);
  }

  /**
   * {@inheritDoc}
   */
  @Override
  public DescriptorImpl getDescriptor() {
    return DESCRIPTOR;
  }

  /**
   * Exception to signal that the build has failed. We use this to avoid having
   * to pass booleans around.
   */
  static final class BuildFailedException extends RuntimeException {

    private static final long serialVersionUID = 1312530341349235548L;

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
    private String title;
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
      this.title = formData.getString("title");
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

    public String getTitle() {
      return this.title;
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
