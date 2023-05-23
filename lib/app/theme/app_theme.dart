import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  final bool? isDark;

  static const Color _grey800 = Color(0xFF424242); // Constant value of _primaryColor.shade800.

  static const VisualDensity _visualDensity = VisualDensity.standard;

  static const MaterialColor _primaryColor = Colors.grey;

  final ThemeData _darkTheme = ThemeData.from(
    useMaterial3: true,
    colorScheme:
        ColorScheme.fromSwatch(primarySwatch: _primaryColor, brightness: Brightness.dark, errorColor: Colors.red)
            .copyWith(secondary: _primaryColor.shade600),
  ).copyWith(
    scaffoldBackgroundColor: _primaryColor.shade700,
    checkboxTheme: CheckboxThemeData(fillColor: MaterialStateProperty.all<Color>(_primaryColor)),
    focusColor: _primaryColor,
    indicatorColor: Colors.teal.shade200,
    disabledColor: _primaryColor.shade600,
    primaryIconTheme: IconThemeData(color: _primaryColor[350]),
    appBarTheme: const AppBarTheme(shadowColor: Colors.black54, elevation: 2),
    radioTheme: RadioThemeData(fillColor: MaterialStateProperty.all<Color?>(_primaryColor.shade400)),
    textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: _primaryColor[350])),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: _primaryColor[350],
        backgroundColor: _primaryColor.shade800,
        visualDensity: _visualDensity,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      extendedPadding: const EdgeInsets.symmetric(horizontal: 16),
      backgroundColor: _primaryColor.shade600,
      foregroundColor: Colors.white,
      disabledElevation: 0,
    ),
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: _primaryColor[850],
      iconTheme: MaterialStateProperty.all<IconThemeData>(
        IconThemeData(color: _primaryColor[350]),
      ),
    ),
    navigationRailTheme: NavigationRailThemeData(
      indicatorColor: _primaryColor.shade600,
      backgroundColor: const Color(0xFF585858),
      selectedIconTheme: IconThemeData(color: _primaryColor.shade200),
      unselectedIconTheme: IconThemeData(color: _primaryColor[350]),
      selectedLabelTextStyle: TextStyle(color: _primaryColor.shade200),
      unselectedLabelTextStyle: TextStyle(color: _primaryColor[350]),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: _primaryColor.shade300,
        visualDensity: _visualDensity,
        backgroundColor: Colors.transparent,
        side: BorderSide(color: _primaryColor.shade400),
      ),
    ),
  );

  final ThemeData _lightTheme = ThemeData.from(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: _primaryColor, errorColor: Colors.red.shade900),
  ).copyWith(
    primaryColor: _primaryColor.shade400,
    disabledColor: _primaryColor.shade600,
    scaffoldBackgroundColor: _primaryColor[350], // AAA compliant.
    primaryIconTheme: IconThemeData(color: _primaryColor[850]),
    dialogBackgroundColor: _primaryColor[350],
    splashColor: _primaryColor.shade300,
    focusColor: _primaryColor.shade200,
    indicatorColor: Colors.teal,
    dialogTheme: DialogTheme(backgroundColor: _primaryColor.shade100),
    radioTheme: RadioThemeData(fillColor: MaterialStateProperty.all<Color>(Colors.black)),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _primaryColor[850],
        padding: EdgeInsets.zero,
        elevation: 0,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: _primaryColor[850],
        backgroundColor: _primaryColor.shade100,
        visualDensity: _visualDensity,
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 2,
      shadowColor: Colors.black45,
      iconTheme: const IconThemeData(color: _grey800),
      backgroundColor: _primaryColor.shade400,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      extendedPadding: const EdgeInsets.symmetric(horizontal: 16),
      backgroundColor: _primaryColor.shade100,
      foregroundColor: _primaryColor[850],
      focusElevation: 10,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: _primaryColor[850],
        visualDensity: _visualDensity,
        backgroundColor: Colors.transparent,
        side: const BorderSide(color: _grey800),
      ),
    ),
    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: _primaryColor.shade400,
      selectedIconTheme: IconThemeData(color: _primaryColor.shade900),
      unselectedIconTheme: IconThemeData(color: _primaryColor[850]),
      selectedLabelTextStyle: TextStyle(color: _primaryColor.shade900),
      unselectedLabelTextStyle: TextStyle(color: _primaryColor[850]),
    ),
  );

  ThemeData get theme {
    final bool isDarkTheme = isDark ?? PlatformDispatcher.instance.platformBrightness == Brightness.dark;

    return isDarkTheme ? _darkTheme : _lightTheme;
  }

  AppTheme({this.isDark});
}
