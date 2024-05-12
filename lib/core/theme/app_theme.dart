import 'package:flutter/material.dart';

const primaryColor = Color(0xff082659);
const secondaryColor = Color(0xff51eec2);

final ThemeData darkAppTheme = ThemeData(
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
    elevation: 0,
  ),

  // Input Decoration Theme
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    floatingLabelStyle: const TextStyle(color: primaryColor),
    iconColor: secondaryColor,
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.blueAccent),
      borderRadius: BorderRadius.circular(8),
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: primaryColor),
      borderRadius: BorderRadius.circular(8),
    ),
  ),

  // Dialog
  dialogTheme: const DialogTheme(backgroundColor: primaryColor),

  // Progress indicator
  progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.white),
);

final ThemeData lightAppTheme = ThemeData(
  // Set the brightness of the app to dark mode
  brightness: Brightness.light,

  // Default && primmary color of the app
  primaryColor: primaryColor,
  colorScheme: const ColorScheme.light(
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
    elevation: 0,
  ),

  // Input Decoration Theme
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    floatingLabelStyle: const TextStyle(color: primaryColor),
    iconColor: secondaryColor,
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: primaryColor),
      borderRadius: BorderRadius.circular(8),
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: primaryColor),
      borderRadius: BorderRadius.circular(8),
    ),
  ),

  // Dialog
  dialogTheme: const DialogTheme(backgroundColor: primaryColor),

  // Progress indicator
  progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.grey),
);
