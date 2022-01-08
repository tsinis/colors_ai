import 'dart:ui' show Color;

import 'package:colors_ai/color_generator/models/colors/constants.dart';
import 'package:colors_ai/core/extensions/color_palette_extension.dart';
import 'package:colors_ai/core/models/color_palette/color_palette.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => group('ColorPaletteExtension toPalette()', () {
      test('from empty list', () => expect(<Color>[].toPalette(), const ColorPalette()));
      test('from valid list', () => expect(kDefaultColors.toPalette(), const ColorPalette(colors: kDefaultColors)));
    });
