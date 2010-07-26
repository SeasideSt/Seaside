package st.seaside;


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
}
