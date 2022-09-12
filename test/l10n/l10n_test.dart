import 'dart:ui';

import 'package:colors_ai/core/extensions/context_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => group(
      '$AppLocalizations',
      () => test('supportedLocales', () {
        final Set<String> expectedLocales = <String>{'cs', 'en', 'ru', 'sk'};
        final Iterable<String> supportedLocales = AppLocalizations.supportedLocales.map((Locale l) => l.languageCode);
        for (final String locale in expectedLocales) {
          expect(supportedLocales.contains(locale), isTrue);
        }
      }),
    );
