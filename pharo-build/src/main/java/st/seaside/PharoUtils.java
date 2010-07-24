package st.seaside;



final class PharoUtils {

  private PharoUtils() {
    throw new AssertionError("not instantiable");
  }

  static String stripDotImage(String s) {
    if (s.endsWith(".image")) {
      return s.substring(0, s.length() - ".image".length());
    } else {
      return s;
    }
  }
}
