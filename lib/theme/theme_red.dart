import 'package:flutter/material.dart';
import 'package:mymusic/common/app_color.dart';

class AppTheme {
  static ThemeData buildRedTheme() {
    const Color primaryColor = AppColors.color_main;
    final ThemeData base = new ThemeData.light();
    return base.copyWith(
      primaryColor: primaryColor,
      buttonColor: primaryColor,
      indicatorColor: Colors.white,
      accentColor: Colors.white,
      canvasColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      errorColor:  Colors.lightBlue,
      buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}
