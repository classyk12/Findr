//Colors for theme
import 'package:flutter/material.dart';

Color lightPrimary = Color(0xfffcfcff);
Color darkPrimary = Colors.black;
Color lightAccent = Colors.deepPurpleAccent;
Color darkAccent = Colors.deepPurple;
Color lightBG = Color(0xfff0f0f0);
Color darkBG = Colors.black;

ThemeData lightTheme = ThemeData(
  backgroundColor: lightBG,
  primaryColor: lightPrimary,
  accentColor:  lightAccent,
  cursorColor: lightAccent,
  scaffoldBackgroundColor: lightBG,
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: darkBG,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
    ),
  ),
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



