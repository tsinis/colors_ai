import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show SchedulerBinding;

class AppTheme {
  const AppTheme({this.isDark});

  final bool? isDark;

  ThemeData get theme {
    final isDarkTheme = isDark ?? SchedulerBinding.instance?.window.platformBrightness == Brightness.dark;
    return isDarkTheme ? _darkTheme : _lightTheme;
  }

  ThemeData get _lightTheme => ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.grey[400],
      disabledColor: Colors.grey[600],
      errorColor: Colors.red[900],
      scaffoldBackgroundColor: Colors.grey[350], //AAA compliant.
      primaryIconTheme: IconThemeData(color: Colors.grey[850]),
      dialogBackgroundColor: Colors.grey[350],
      splashColor: Colors.grey[300],
      focusColor: Colors.white,
      indicatorColor: Colors.teal,
      dividerColor: Colors.grey[600],
      dialogTheme: DialogTheme(backgroundColor: Colors.grey[100]),
      appBarTheme: const AppBarTheme(iconTheme: IconThemeData(color: _grey800)),
      radioTheme: RadioThemeData(fillColor: MaterialStateProperty.all<Color>(Colors.black)),
      textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(primary: Colors.grey[850])),
      elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(primary: Colors.grey[200])),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: Colors.grey[200], foregroundColor: Colors.grey[850]),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          primary: Colors.grey[850],
          backgroundColor: Colors.transparent,
          side: const BorderSide(color: _grey800),
        ),
      ),
      navigationRailTheme: NavigationRailThemeData(
          backgroundColor: Colors.grey[400],
          selectedIconTheme: IconThemeData(color: Colors.grey[900]!),
          unselectedIconTheme: IconThemeData(color: Colors.grey[850]!),
          selectedLabelTextStyle: TextStyle(color: Colors.grey[900]!),
          unselectedLabelTextStyle: TextStyle(color: Colors.grey[850]!)));

  ThemeData get _darkTheme => ThemeData.from(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey, brightness: Brightness.dark)
              .copyWith(error: Colors.red, secondary: Colors.grey[600]))
      .copyWith(
          scaffoldBackgroundColor: Colors.grey[700],
          checkboxTheme: CheckboxThemeData(fillColor: MaterialStateProperty.all<Color>(Colors.grey)),
          focusColor: Colors.grey,
          indicatorColor: Colors.teal[200],
          disabledColor: Colors.grey[600],
          primaryIconTheme: IconThemeData(color: Colors.grey[350]),
          radioTheme: RadioThemeData(fillColor: MaterialStateProperty.all<Color>(Colors.grey[400]!)),
          textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(primary: Colors.grey[350])),
          elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(primary: Colors.grey[350])),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.grey[600]!, foregroundColor: Colors.white, disabledElevation: 0),
          navigationRailTheme: NavigationRailThemeData(
              backgroundColor: const Color(0xFF555555),
              selectedIconTheme: IconThemeData(color: Colors.grey[200]!),
              unselectedIconTheme: IconThemeData(color: Colors.grey[350]!),
              selectedLabelTextStyle: TextStyle(color: Colors.grey[200]!),
              unselectedLabelTextStyle: TextStyle(color: Colors.grey[350]!)),
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
            primary: Colors.grey[300],
            backgroundColor: Colors.transparent,
            side: BorderSide(color: Colors.grey[400]!),
          )));

  static const Color _grey800 = Color(0xFF424242); // Constant value of Colors.grey[800].

}
