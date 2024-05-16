import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryColor = const Color(0xffB7935F);
  static Color primaryDarkColor = const Color(0xff141A2E);
  static Color goldColor = const Color(0xffFACC1D);
  static Color textColor = Colors.black;
  static Color textDarkColor = Colors.white;
  //----------------------------------------------------------------------------
  //-------------------------------LightTheme-----------------------------------
  static ThemeData lightTheme = ThemeData(
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(size: 30, color: Colors.black),
          centerTitle: true,
          backgroundColor: Colors.transparent),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: primaryColor,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
      ),
      brightness: Brightness.light);
  //----------------------------------------------------------------------------
  //-------------------------------DarkTheme------------------------------------

  static ThemeData darkTheme = ThemeData(
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(size: 30, color: Colors.white),
          centerTitle: true,
          backgroundColor: Colors.transparent),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: const Color(0xff141A2E),
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.white,
      ),
      brightness: Brightness.dark);
}
