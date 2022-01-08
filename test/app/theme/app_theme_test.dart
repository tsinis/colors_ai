import 'package:colors_ai/app/theme/app_theme.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => group('$AppTheme', () {
      test('Default state', () => expect(AppTheme().isDark, null));

      late AppTheme appData;
      test('Returns dark theme', () {
        appData = AppTheme(isDark: true);
        expect(appData.isDark, true);
        expect(appData.theme.brightness, Brightness.dark);
      });

      test('Returns light theme', () {
        appData = AppTheme(isDark: false);
        expect(appData.isDark, false);
        expect(appData.theme.brightness, Brightness.light);
      });
    });
