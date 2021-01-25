import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.grey,
  errorColor: Colors.red[900]!,
  scaffoldBackgroundColor: Colors.grey[400], //AAA compliant.
  primaryIconTheme: IconThemeData(color: Colors.grey[850]),
  dialogBackgroundColor: Colors.grey[350],
  splashColor: Colors.grey[350],
  dividerColor: _grey800,
  dialogTheme: DialogTheme(backgroundColor: Colors.grey[100]),
  appBarTheme: const AppBarTheme(iconTheme: IconThemeData(color: _grey800)),
  radioTheme: RadioThemeData(fillColor: MaterialStateProperty.all<Color>(Colors.black)),
  textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(primary: Colors.grey[850])),
  elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(primary: Colors.grey[350])),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          primary: Colors.grey[850], backgroundColor: Colors.transparent, side: const BorderSide(color: _grey800))),
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: Colors.grey[300], foregroundColor: Colors.grey[850]),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(size: 24),
      unselectedIconTheme: IconThemeData(size: 20),
      backgroundColor: Colors.grey,
      unselectedItemColor: _grey800,
      selectedItemColor: Colors.black,
      showUnselectedLabels: false,
      showSelectedLabels: false),
);

const Color _grey800 = Color(0xFF424242); // Constant value of Colors.grey[800].
