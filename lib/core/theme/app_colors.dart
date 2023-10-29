import 'package:flutter/material.dart';

class AppColors {
  // Global
  static const Color primaryColor = Color(0xFFFFF50A);
  static const Color secondaryColor = Color(0xFF192126);
  static const Color backgroundColor = Color(0xFF062029);
  static const Color surfaceColor = Color(0xFFF8F6FE);
  static const Color activeIconColor = primaryColor;
  static const Color inactiveIconColor = secondaryColor;
  static const Color textfieldBackgroundColor = Color(0xFFFFFFFF);
  static const Color hintTextColor = Color(0xFFA9A9A9);
  static const Color textColor = Color(0xFFFFFFFF);
  static const Color lighterTextColor = Color(0xFFFFF50A);
  static const Color secondaryTextColor = Color(0xFF000000);

  //Gradient
  static LinearGradient gradient1 = LinearGradient(
      colors: [backgroundColor, backgroundColor.withOpacity(0)],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter);
}
