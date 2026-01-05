import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppThemes {
  static ThemeData themeDataDark = ThemeData(
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
    appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff464646),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xff464646),
          statusBarIconBrightness: Brightness.light,
        )),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xff464646),
        elevation: 5,
        selectedIconTheme: IconThemeData(color: Colors.deepOrange),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(),
    scaffoldBackgroundColor: const Color(0xff464646),

    //cardTheme: const CardTheme(color: Color(0xff464646), elevation: 10),

    iconTheme: const IconThemeData(color: Colors.white),
    //  colorScheme: const ColorScheme(background: Color(0xff464646)),
  );
//////////////////////////////////////////////////////////////////// Todo:
  static ThemeData themeDataLight = ThemeData(
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
    appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark)),
    iconTheme: const IconThemeData(color: Colors.black),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        elevation: 5,
        selectedIconTheme: IconThemeData(color: Colors.deepOrange),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.black),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
  );
}
