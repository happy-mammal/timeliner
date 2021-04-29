import 'package:flutter/material.dart';
import 'package:timeliner/utils/colors.dart';

class AppTheme {
  ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      canvasColor: AppColors.darkCanvasColor,
      backgroundColor: AppColors.darkBackgroundColor,
      accentColor: Colors.blueAccent,
    );
  }

  ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      canvasColor: AppColors.lightCanvasColor,
      backgroundColor: AppColors.lightBackgroundColor,
      accentColor: Colors.blueAccent,
    );
  }
}
