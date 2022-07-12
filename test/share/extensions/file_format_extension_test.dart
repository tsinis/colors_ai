import 'package:colors_ai/share/extensions/file_format_extension.dart';
import 'package:colors_ai/share/models/file_format.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => group('FileFormatExtension', () {
      const Set<FileFormat> letter = <FileFormat>{FileFormat.pdfLetter, FileFormat.pngLetter};
      const Set<FileFormat> a4Format = <FileFormat>{FileFormat.pdfA4, FileFormat.pngA4};

      test('title', () {
        for (final FileFormat file in FileFormat.values) {
          expect(file.title.contains(file.name.toUpperCase().substring(0, 3)), true);
        }
      });

      test('format', () {
        for (final FileFormat file in FileFormat.values) {
          expect(file.format.contains(file.name.toUpperCase().substring(0, 3)), true);
        }
      });

      test('isLetter', () {
        for (final FileFormat file in FileFormat.values) {
          expect(file.isLetter, letter.contains(file));
        }
      });

      test('isA4', () {
        for (final FileFormat file in FileFormat.values) {
          expect(file.isA4, a4Format.contains(file));
        }
      });

      test('isPrintable', () {
        for (final FileFormat file in FileFormat.values) {
          expect(file.isPrintable, letter.contains(file) || a4Format.contains(file));
        }
      });
    });
