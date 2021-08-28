import 'package:flutter/material.dart';
import 'package:onmascota/utils/constants.dart';

ThemeData themeData = ThemeData(
  fontFamily: "Tahoma",
  primaryColor: primaryColor,
  buttonColor: primaryColor,
  accentColor: primaryColor,
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
    ),
  ),
);
