import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:platform_info/platform_info.dart';

import '../../core/ui/constants.dart';

Locale get detectedLocale {
  final Iterable<String> supportedLocales = AppLocalizations.supportedLocales.map((Locale l) => l.languageCode);
  final String detectedLanguageCode = Platform.instance.locale;

  return Locale.fromSubtags(
    languageCode: supportedLocales.contains(detectedLanguageCode) ? detectedLanguageCode : kDefaultLanguageCode,
  );
}
