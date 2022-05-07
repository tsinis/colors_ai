import 'package:colors_ai/core/services/clipboard.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../color_picker/data.dart';
import '../../data/mocks/clipboard_mock.dart';

void main() => group('$ClipBoard', () {
      const ClipBoard clipboard = ClipBoard();

      setUpAll(TestWidgetsFlutterBinding.ensureInitialized);

      setUp(() => SystemChannels.platform.setMockMethodCallHandler(ClipboardMock().handleMethodCall));

      group('copyTextData and data', () {
        test('valid data', () async {
          await clipboard.copyTextData('data');
          final String? clipboardData = await clipboard.data;
          expect(clipboardData, 'data');
        });

        test('empty data', () async {
          await clipboard.copyTextData('');
          final String? clipboardData = await clipboard.data;
          expect(clipboardData, null);
        });

        test('null data', () async {
          await clipboard.copyTextData();
          final String? clipboardData = await clipboard.data;
          expect(clipboardData, null);
        });
      });

      test('copyColor valid color', () async {
        await clipboard.copyColor(color);
        final String? clipboardData = await clipboard.data;
        expect(clipboardData, 'FFFFFF');
      });

      test('copyColor null color', () async {
        await clipboard.copyColor();
        final String? clipboardData = await clipboard.data;
        expect(clipboardData, null);
      });
    });
