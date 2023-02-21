import 'package:flutter/material.dart';

class ThemeStyle {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return isDarkTheme
        ? ThemeData(
            primarySwatch: Colors.grey,
            primaryColor: Colors.black,
            brightness: Brightness.dark,
            backgroundColor: Color(0xFF212121),
            accentColor: Color(0xff896277),
            accentIconTheme: IconThemeData(color: Colors.black),
            dividerColor: Colors.black12,
            textTheme: TextTheme(
              headline1: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.w600,
              ),
              headline2: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
              bodyText1: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              caption: TextStyle(
                fontSize: 14,
              ),
            ),
          )
        : ThemeData(
            primarySwatch: Colors.orange,
            primaryColor: Colors.orange,
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            accentColor: Color(0xff896277),
            accentIconTheme: IconThemeData(color: Colors.white),
            dividerColor: Colors.white60,
            textTheme: TextTheme(
              headline1: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.w600,
              ),
              headline2: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
              bodyText1: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              caption: TextStyle(
                fontSize: 14,
              ),
            ),
          );
  }
}
