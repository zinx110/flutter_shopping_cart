import 'package:flutter/material.dart';

class AppTheme {
  static final appTheme = ThemeData(
      fontFamily: "Lato",
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromRGBO(254, 206, 1, 1),
        primary: const Color.fromRGBO(254, 206, 1, 1),
      ),
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
      ),
      useMaterial3: true,
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 32,
        ),
        titleMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        bodySmall: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ));
}
