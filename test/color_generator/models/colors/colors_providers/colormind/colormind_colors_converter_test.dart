import 'dart:ui';

import 'package:colors_ai/color_generator/models/colors/colors_providers/colormind/colormind_colors_converter.dart';
import 'package:colors_ai/core/models/typedef_aliases/int_rgb_color.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => group('$ColormindColorsConverter', () {
      const ColormindColorsConverter converter = ColormindColorsConverter();
      const Color blackColor = Color.fromRGBO(0, 0, 0, 1);
      const Color whiteColor = Color.fromRGBO(255, 255, 255, 1);
      const List<int> blackIntColor = <int>[0, 0, 0];

      group('fromJson', () {
        test('with valid color and length', () {
          final List<Color> colors = converter.fromJson(<List<int>>[blackIntColor]);
          expect(colors.single, blackColor);
        });

        test('with invalid color length', () {
          final List<Color> colors = converter.fromJson(<List<int>>[
            <int>[0],
          ]);
          expect(colors.single, whiteColor);
        });

        test(
          'with invalid color type',
          () async => expectLater(
            () => converter.fromJson(<String>['0']),
            throwsA(isA<Exception>()),
          ),
        );
      });

      test('toJson', () {
        final List<IntRGBColor> intColors = converter.toJson(<Color>[blackColor]);
        expect(intColors.single, blackIntColor);
      });
    });
