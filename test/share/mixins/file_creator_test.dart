import 'dart:io';
import 'dart:typed_data' show Uint8List;

import 'package:colors_ai/share/mixins/file_creator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'data.dart';

class _FileCreatorTest with FileCreator {}

void main() => group('$FileCreator', () {
      final _FileCreatorTest fileCreator = _FileCreatorTest();

      late final Uint8List a4PdfBytes;
      late final Uint8List letterPdfBytes;

      setUpAll(() async {
        const String filePath = './test/data/files/file_creator_test_';
        letterPdfBytes = await File('${filePath}letter.pdf').readAsBytes();
        a4PdfBytes = await File('${filePath}a4.pdf').readAsBytes();
      });

      setUp(TestWidgetsFlutterBinding.ensureInitialized);

      group('generateFile()', () {
        test('isMetric: false', () async {
          final Uint8List generatedPdfBytes = await fileCreator.generateFile(palette, isMetric: false);
          expect(generatedPdfBytes.elementSizeInBytes, letterPdfBytes.elementSizeInBytes);
          expect(generatedPdfBytes.length, isNot(a4PdfBytes.length));
        });

        test('isMetric: true', () async {
          final Uint8List generatedPdfBytes = await fileCreator.generateFile(palette);
          expect(generatedPdfBytes.elementSizeInBytes, a4PdfBytes.elementSizeInBytes);
          expect(generatedPdfBytes.length, isNot(letterPdfBytes.length));
        });
      });
    });
