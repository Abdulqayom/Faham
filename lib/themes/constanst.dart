import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromARGB(255, 255, 255, 255);
const kAppBar = Color.fromRGBO(7, 41, 77, 1);
const kSecondrtColor = Color.fromRGBO(255, 198, 0, 1);
const listItemColor = Color.fromARGB(255, 13, 96, 88);
const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color.fromARGB(255, 165, 168, 185);
const bgColor = Color(0xFF212332);

const defaultPadding = 16.0;

// const listItemColor = Color.fromRGBO(64, 75, 96, .8);
final RegExp emailValidationReqExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const emailNullValue = 'Please enter your Email';
const passwordNullValue = 'Please enter your Password';
const invelidEmailError = 'Please enter velid email';
const fullNameNull = 'Please enter your full name';

final headingStyle = TextStyle(
  fontSize: 20,
  color: Colors.white,
  fontWeight: FontWeight.bold,
  height: 1.5,
);
