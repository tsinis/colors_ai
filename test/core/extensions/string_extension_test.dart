import 'package:colors_ai/core/extensions/string_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => group('StringExtension toBeginningOfSentenceCase()', () {
      test('from single char', () => expect('a'.toBeginningOfSentenceCase(), 'A'));
      test('from single word', () => expect('axe'.toBeginningOfSentenceCase(), 'Axe'));
      test('from sentence', () => expect('1 aXe!'.toBeginningOfSentenceCase(), '1 axe!'));
    });
