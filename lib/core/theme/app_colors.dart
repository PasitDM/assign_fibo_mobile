import 'package:flutter/material.dart';

class AppColors {
  // Primary and Secondary Colors
  static const Color primaryColor = Colors.blueGrey;
  static const Color secondaryColor = Color(0xff9C27B0);

  // Text Colors
  static const Color textColor = Color(0xff000000);
  static const Color descColor = Color(0xff6C6C6C);

  // Background Colors
  static const Color lightBG = Color(0xffFCF9F5);
  static const Color darkBG = Color(0xff1B1D26);

  // Status Colors
  static const Color doneColor = Color(0xff25AF5C);
  static const Color errorColor = Color(0xffED1C24);

  // General Colors
  static const Color white = Color(0xffFFFFFF);

  /// Color Theme
  static const ColorScheme kColorScheme = ColorScheme(
    primary: primaryColor,
    secondary: secondaryColor,
    surface: Colors.white,
    error: errorColor,
    onPrimary: darkBG,
    onSecondary: secondaryColor,
    onSurface: darkBG,
    onError: white,
    brightness: Brightness.light,
  );
}
