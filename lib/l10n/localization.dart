import 'dart:async';

import 'package:flutter/material.dart';

class FlutterBlocLocalizations {
  static FlutterBlocLocalizations? of(BuildContext context) =>
      Localizations.of<FlutterBlocLocalizations>(context, FlutterBlocLocalizations);

  String get appTitle => 'Colors AI';
}

class FlutterBlocLocalizationsDelegate extends LocalizationsDelegate<FlutterBlocLocalizations> {
  @override
  Future<FlutterBlocLocalizations> load(Locale locale) => Future(() => FlutterBlocLocalizations());

  @override
  bool shouldReload(FlutterBlocLocalizationsDelegate old) => false;

  @override
  bool isSupported(Locale locale) => locale.languageCode.toLowerCase().contains('en');
}
