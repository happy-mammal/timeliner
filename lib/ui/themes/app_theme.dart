import 'package:flutter/material.dart';

class AppTheme {
  ThemeData lightTheme() {
    return ThemeData(brightness: Brightness.light);
  }

  ThemeData darkTheme() {
    return ThemeData(
      shadowColor: Color(0xff3A86FF),
      primaryColor: Color(0xff3A86FF),
      secondaryHeaderColor: Color(0xff3A86FF),
      accentColor: Color(0xff3A86FF),
      backgroundColor: Colors.black,
      brightness: Brightness.dark,
      cardColor: Colors.black,
      bottomAppBarColor: Colors.black,
    );
  }
}
