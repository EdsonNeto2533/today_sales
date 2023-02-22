import 'package:flutter/material.dart';

class ManageUTheme {
  static Color primaryColor = const Color.fromRGBO(83, 200, 152, 1);
  static Color fadingGrey = Color.fromRGBO(67, 65, 65, 0.72);

  static ThemeData get appTheme => ThemeData(
        primaryColor: primaryColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            padding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(44),
            ),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: primaryColor,
        ),
      );
}
