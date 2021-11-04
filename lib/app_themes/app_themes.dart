import 'package:flutter/material.dart';

enum AppThemes {
  light,
  dark,
}

class AppThemeData {
  //theme map
  static final themeData = {
    AppThemes.light: ThemeData(
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: Colors.black,
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
    ),
    AppThemes.dark: ThemeData(
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.grey[800],
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: Colors.white,
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
    ),
  };
}
