//Colors for theme
import 'package:flutter/material.dart';

Color lightPrimary = Color(0xfffcfcff);
Color darkPrimary = Colors.black;
Color lightAccent = Color(0xff084545);
Color darkAccent = Color(0xff084545);
Color lightBG = Color(0xfff0f0f0);
Color darkBG = Color(0xff4C4D4E);

ThemeData lightTheme = ThemeData(
  backgroundColor: lightBG,
  primaryColor: lightPrimary,
  accentColor:  lightAccent,
  cursorColor: lightAccent,
  scaffoldBackgroundColor: lightBG,
//  textTheme: TextTheme(
//    body2: TextStyle(
//      color: darkBG,
//      fontSize: 16.0,
//      fontWeight: FontWeight.w500,
//    ),
//    body1: TextStyle(
//      color: darkBG,
//      fontSize: 16.0,
//      fontWeight: FontWeight.w500,
//    ),
//  ),
  hintColor: Colors.grey,
  buttonTheme: ButtonThemeData(
      splashColor: lightAccent,
    buttonColor: darkAccent,
    textTheme: ButtonTextTheme.primary
  ),

  appBarTheme: AppBarTheme(
    elevation: 0,
    color: lightBG,
    textTheme: TextTheme(
      headline6: TextStyle(
        color: darkBG,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  backgroundColor: darkBG,
  primaryColor: darkPrimary,
  accentColor: darkAccent,
  scaffoldBackgroundColor: darkBG,
  cursorColor: darkAccent,
  cardColor: darkBG,

  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: lightBG,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
    ),
  ),
  hintColor: Colors.grey,
  buttonTheme: ButtonThemeData(
   splashColor: lightAccent,
   buttonColor: darkAccent,
      textTheme: ButtonTextTheme.normal
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    textTheme: TextTheme(
      headline6: TextStyle(
        color: lightBG,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
    ),
  ),
);



