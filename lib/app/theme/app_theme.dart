import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show SchedulerBinding;

class AppTheme {
  final bool? isDark;

  static const Color _grey800 = Color(0xFF424242); // Constant value of Colors.grey[800].
  static const RoundedRectangleBorder _material3ButtonShape =
      RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)));

  static const RoundedRectangleBorder _material3FabBorder =
      RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16)));

  static const BoxConstraints _material3FabSize = BoxConstraints.tightForFinite(height: 56);
  static const VisualDensity _visualDensity = VisualDensity.standard;

  final ThemeData _darkTheme = ThemeData.from(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey, brightness: Brightness.dark).copyWith(
      error: Colors.red,
      secondary: Colors.grey[600],
    ),
  ).copyWith(
    scaffoldBackgroundColor: Colors.grey[700],
    checkboxTheme: CheckboxThemeData(fillColor: MaterialStateProperty.all<Color>(Colors.grey)),
    focusColor: Colors.grey,
    indicatorColor: Colors.teal[200],
    disabledColor: Colors.grey[600],
    primaryIconTheme: IconThemeData(color: Colors.grey[350]),
    appBarTheme: const AppBarTheme(shadowColor: Colors.black54, elevation: 2),
    radioTheme: RadioThemeData(fillColor: MaterialStateProperty.all<Color?>(Colors.grey[400])),
    textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(primary: Colors.grey[350])),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: _material3ButtonShape,
        primary: Colors.grey[350],
        visualDensity: _visualDensity,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      extendedPadding: const EdgeInsets.symmetric(horizontal: 16),
      extendedSizeConstraints: _material3FabSize,
      shape: _material3FabBorder,
      backgroundColor: Colors.grey[600],
      foregroundColor: Colors.white,
      disabledElevation: 0,
    ),
    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: const Color(0xFF585858),
      selectedIconTheme: IconThemeData(color: Colors.grey[200]),
      unselectedIconTheme: IconThemeData(color: Colors.grey[350]),
      selectedLabelTextStyle: TextStyle(color: Colors.grey[200]),
      unselectedLabelTextStyle: TextStyle(color: Colors.grey[350]),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        visualDensity: _visualDensity,
        primary: Colors.grey[300],
        backgroundColor: Colors.transparent,
        shape: _material3ButtonShape,
        side: BorderSide(color: Colors.grey[400]!),
      ),
    ),
  );

  final ThemeData _lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.grey[400],
    disabledColor: Colors.grey[600],
    errorColor: Colors.red[900],
    scaffoldBackgroundColor: Colors.grey[350], //AAA compliant.
    primaryIconTheme: IconThemeData(color: Colors.grey[850]),
    dialogBackgroundColor: Colors.grey[350],
    splashColor: Colors.grey[300],
    focusColor: Colors.grey[200],
    indicatorColor: Colors.teal,
    dialogTheme: DialogTheme(backgroundColor: Colors.grey[100]),
    radioTheme: RadioThemeData(fillColor: MaterialStateProperty.all<Color>(Colors.black)),
    textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(primary: Colors.grey[850])),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.grey[200],
        shape: _material3ButtonShape,
        visualDensity: _visualDensity,
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 2,
      shadowColor: Colors.black45,
      iconTheme: const IconThemeData(color: _grey800),
      backgroundColor: Colors.grey[400],
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      extendedPadding: const EdgeInsets.symmetric(horizontal: 16),
      extendedSizeConstraints: _material3FabSize,
      shape: _material3FabBorder,
      backgroundColor: Colors.grey[100],
      foregroundColor: Colors.grey[850],
      focusElevation: 10,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: Colors.grey[850],
        visualDensity: _visualDensity,
        backgroundColor: Colors.transparent,
        shape: _material3ButtonShape,
        side: const BorderSide(color: _grey800),
      ),
    ),
    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: Colors.grey[400],
      selectedIconTheme: IconThemeData(color: Colors.grey[900]),
      unselectedIconTheme: IconThemeData(color: Colors.grey[850]),
      selectedLabelTextStyle: TextStyle(color: Colors.grey[900]),
      unselectedLabelTextStyle: TextStyle(color: Colors.grey[850]),
    ),
  );

  ThemeData get theme {
    final isDarkTheme = isDark ?? SchedulerBinding.instance?.window.platformBrightness == Brightness.dark;

    return isDarkTheme ? _darkTheme : _lightTheme;
  }

  AppTheme({this.isDark});
}
