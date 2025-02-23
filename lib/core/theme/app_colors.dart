import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Colors.blueGrey;
  static const Color secondaryColor = Color(0xff9C27B0);
  static const Color textColor = Color(0xff000000);
  static const Color lightBG = Color(0xffFCF9F5);
  static const Color doneColor = Color(0xff25AF5C);
  static const Color removeColor = Color(0xff25AF5C);

  static const Color white = Color(0xffFFFFFF);
  static const Color darkBG = Color(0xff1B1D26);

  static const Color red300 = Color(0xffED1C24);

  /// Color Theme
  static const ColorScheme kColorScheme = ColorScheme(
    primary: primaryColor,
    secondary: secondaryColor,
    surface: Colors.white,
    error: red300,
    onPrimary: darkBG,
    onSecondary: secondaryColor,
    onSurface: darkBG,
    onError: white,
    brightness: Brightness.light,
  );
}
