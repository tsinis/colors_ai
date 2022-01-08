import 'dart:ui';

import 'package:colors_ai/color_generator/models/colors/constants.dart';
import 'package:colors_ai/core/models/color_palette/color_palette.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => group('$ColorPalette', () {
      test('with empty list', () => expect(const ColorPalette().colors, isEmpty));
      test('with valid list', () => expect(const ColorPalette(colors: kDefaultColors).colors, kDefaultColors));

      test('equality', () {
        const ColorPalette paletteFromRgbOpaque = ColorPalette(colors: <Color>[Color.fromRGBO(0, 0, 0, 0)]);
        const ColorPalette paletteFromRgb = ColorPalette(colors: <Color>[Color.fromRGBO(0, 0, 0, 1)]);
        const ColorPalette paletteFromColor = ColorPalette(colors: <Color>[Color(0xFF000000)]);
        expect(paletteFromRgb == paletteFromColor, true);
        expect(paletteFromRgb != paletteFromRgbOpaque, true);
      });
    });
