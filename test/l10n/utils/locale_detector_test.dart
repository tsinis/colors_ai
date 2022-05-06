import 'dart:ui';

import 'package:colors_ai/core/ui/constants.dart';
import 'package:colors_ai/l10n/utils/detected_locale.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => test('detectedLocale', () => expect(detectedLocale, const Locale(kDefaultLanguageCode)));
