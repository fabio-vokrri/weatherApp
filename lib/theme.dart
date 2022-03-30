import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  appBarTheme: const AppBarTheme(
    color: Colors.transparent,
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.blue[900]),
  inputDecorationTheme: InputDecorationTheme(
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blue[900]!,
      ),
    ),
    iconColor: Colors.blue[900]!,
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blue[900]!,
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blue[800]!,
      ),
    ),
  ),
  textTheme: TextTheme(
    bodyText1: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.white70,
    ),
    bodyText2: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.white70,
    ),
    headline1: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.w700,
      color: Colors.blue[900]!,
    ),
    headline2: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    headline3: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: Colors.white70,
    ),
  ),
);
