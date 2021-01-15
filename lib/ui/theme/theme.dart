import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.grey,
  scaffoldBackgroundColor: Colors.grey[600],
  primaryIconTheme: IconThemeData(color: Colors.grey[850]),
  dialogBackgroundColor: Colors.grey[350],
  dividerColor: Colors.grey[800],
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: Colors.grey[350], foregroundColor: Colors.grey[850]),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(size: 24),
      unselectedIconTheme: IconThemeData(size: 20),
      backgroundColor: Colors.grey,
      unselectedItemColor: Color(0xFF3A3A3A),
      selectedItemColor: Colors.black,
      showUnselectedLabels: false,
      showSelectedLabels: false),
);
