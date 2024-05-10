import 'package:flutter/material.dart';

const primaryColor = Color(0xff082659);
const secondaryColor = Color(0xff51eec2);

final ThemeData appTheme = ThemeData(
  // Set the brightness of the app to dark mode
  brightness: Brightness.dark,

  // Default && primmary color of the app
  primaryColor: primaryColor,
  colorScheme: const ColorScheme.dark(
    primary: primaryColor,
  ),

  // AppBar theme
  appBarTheme: const AppBarTheme(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
    centerTitle: true,
  ),

  // Floating Action Button theme
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
  ),

  // Input Decoration Theme
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelStyle: const TextStyle(color: primaryColor),
    iconColor: secondaryColor,
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: secondaryColor),
      borderRadius: BorderRadius.circular(8),
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: primaryColor),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);
