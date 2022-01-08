import 'package:colors_ai/core/models/typedef_aliases/int_rgb_color.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => group('IntRGBColor', () {
      test('is List<int>', () => expect(<int>[], isA<IntRGBColor>()));
      test('is not List<num>', () => expect(<num>[], isNot(IntRGBColor)));
    });
