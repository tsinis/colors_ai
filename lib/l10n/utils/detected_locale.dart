import 'package:flutter/material.dart';
import 'package:platform_info/platform_info.dart';

import '../../core/extensions/context_extensions.dart';
import '../../core/ui/constants.dart';

// ignore: prefer-static-class, it's just a workaround.
Locale get detectedLocale {
  final Iterable<String> supportedLocales = AppLocalizations.supportedLocales.map((Locale l) => l.languageCode);
  final String detectedLanguageCode = Platform.instance.locale;

  return Locale.fromSubtags(
    languageCode: supportedLocales.contains(detectedLanguageCode) ? detectedLanguageCode : kDefaultLanguageCode,
  );
}
