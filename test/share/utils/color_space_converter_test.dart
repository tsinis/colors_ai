import 'package:colors_ai/share/models/color_space.dart';
import 'package:colors_ai/share/utils/color_space_converter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => group('colorSpaceConverter()', () {
      const String hex = '000000';

      void testConverter(ColorSpace space) => test('to ${space.name.toUpperCase()}', () {
            final String convertedHex = colorSpaceConverter(space, hex);
            switch (space) {
              case ColorSpace.rgb:
                return expect(convertedHex, '0, 0, 0');
              case ColorSpace.cmyk:
                return expect(convertedHex, '0, 0, 0, 100');
              case ColorSpace.hsb:
              case ColorSpace.hsl:
              case ColorSpace.lab:
                return expect(convertedHex, '0.0, 0.0, 0.0');
              case ColorSpace.xyz:
                return expect(convertedHex, '0.00, 0.00, 0.00');
              case ColorSpace.hex:
                return expect(convertedHex, '000000');
            }
          });

      ColorSpace.values.forEach(testConverter);
    });
