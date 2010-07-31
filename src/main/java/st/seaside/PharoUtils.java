package st.seaside;

import java.io.File;

import hudson.FilePath;


/**
 * Utility methods shared between {@link PharoBuilder} and {@link OneClickBuilder}.
 */
final class PharoUtils {

  private PharoUtils() {
    throw new AssertionError("not instantiable");
  }

  /**
   * Strips {@code ".image"} from the given path if it ends with {@code ".image"}.
   *
   * @param s a file path
   * @return {@code path} without {@code ".image"}.
   */
  static String stripDotImage(String s) {
    if (s.endsWith(".image")) {
      return s.substring(0, s.length() - ".image".length());
    } else {
      return s;
    }
  }


  static FilePath getAbsoluteOrRelativePath(String path, FilePath moduleRoot) {
    if (isAbsolute(path)) {
      return new FilePath(new File(path));
    } else {
      return moduleRoot.child(path);
    }
  }


  private static boolean isAbsolute(String path) {
    return isAbsoluteUnixPath(path) || isAbsoluteWindowsPath(path);
  }

  private static boolean isAbsoluteWindowsPath(String path) {
    return path.length() > 3
      && Character.isLetter(path.charAt(0))
      && path.charAt(1) == ':'
        && path.charAt(2) == '\\';
  }

  private static boolean isAbsoluteUnixPath(String path) {
    return path.charAt(0) == '/';
  }

  static String addDotImage(String s) {
    if (!s.endsWith(".image")) {
      return s + ".image";
    } else {
      return s;
    }
  }


}
