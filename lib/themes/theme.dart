import 'package:faham/themes/constanst.dart';
import 'package:flutter/material.dart';

ThemeData buildThemeData() {
  return ThemeData(
    accentColor: Colors.yellow,
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    iconTheme: const IconThemeData(color: Colors.white),
    scaffoldBackgroundColor: kPrimaryColor,
    appBarTheme: const AppBarTheme(
      color: kAppBar,
      elevation: 0,
      textTheme: TextTheme(
        headline6: TextStyle(
          fontSize: 18,
          fontFamily: 'Pashto',
        ),
      ),
    ),
  );
}

InputDecorationTheme inputDecorationTheme() {
  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: Colors.white),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    suffixStyle:
        const TextStyle(color: Colors.white, backgroundColor: Colors.red),
    focusColor: Colors.yellow,
    // errorStyle: TextStyle(color: Colors.yellow,),
    hintStyle: const TextStyle(color: Colors.white),
    labelStyle: const TextStyle(color: Colors.white),
    // focusedErrorBorder:
    //     OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow)),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 42,
      vertical: 20,
    ),
    enabledBorder: outlineInputBorder,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: const BorderSide(color: Colors.lightBlue),
      gapPadding: 10,
    ),
    border: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    headline1: TextStyle(
      fontFamily: 'Pastho',
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 20,
    ),
    bodyText2: TextStyle(
      fontFamily: 'Pastho',
      color: Colors.white,
      fontSize: 15,
    ),
  );
}
