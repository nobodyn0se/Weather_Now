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
      scaffoldBackgroundColor: Colors.grey[350],
      textTheme: Typography.blackCupertino,
      secondaryHeaderColor: Colors.lightBlue[100],
      appBarTheme:
          const AppBarTheme(iconTheme: IconThemeData(color: Colors.black)),
      iconTheme: const IconThemeData(color: Colors.black),
    ),
    AppThemes.dark: ThemeData(
      primaryColor: Colors.grey[800],
      scaffoldBackgroundColor: Colors.black,
      textTheme: Typography.whiteCupertino,
      secondaryHeaderColor: Colors.lightBlue,
      appBarTheme:
          const AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
      iconTheme: const IconThemeData(color: Colors.white),
    ),
  };
}
