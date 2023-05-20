import 'package:flutter/material.dart';

class ManageUTheme {
  static Color primaryColor = const Color.fromRGBO(83, 200, 152, 1);
  static Color fadingGrey = const Color.fromRGBO(67, 65, 65, 0.72);

  static ThemeData get appTheme => ThemeData(
        primaryColor: primaryColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            padding: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(44),
            ),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: primaryColor,
        ),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: primaryColor),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: primaryColor,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            color: primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          bodySmall: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
      );
}
