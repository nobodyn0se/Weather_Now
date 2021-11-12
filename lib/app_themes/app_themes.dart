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
      cardTheme: const CardTheme(
        color: Colors.white,
      ),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: Colors.black,
        ),
        bodyText2: TextStyle(color: Colors.black),
        headline4: TextStyle(color: Colors.black),
        subtitle1: TextStyle(color: Colors.black),
      ),
      secondaryHeaderColor: Colors.lightBlue[100],
      appBarTheme:
          const AppBarTheme(iconTheme: IconThemeData(color: Colors.black)),
      iconTheme: const IconThemeData(color: Colors.black),
    ),
    AppThemes.dark: ThemeData(
      primaryColor: Colors.grey[800],
      scaffoldBackgroundColor: Colors.black,
      cardTheme: CardTheme(
        color: Colors.grey[800],
      ),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: Colors.white,
        ),
        bodyText2: TextStyle(color: Colors.white),
        headline4: TextStyle(color: Colors.white),
        subtitle1: TextStyle(color: Colors.white), //for search input
      ),
      secondaryHeaderColor: Colors.lightBlue,
      appBarTheme:
          const AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
      iconTheme: const IconThemeData(color: Colors.white),
    ),
  };
}
