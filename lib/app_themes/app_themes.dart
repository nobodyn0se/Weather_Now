import 'package:flutter/material.dart';

enum AppThemes {
  light,
  dark,
}

class AppThemeClass {
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
  };
}
