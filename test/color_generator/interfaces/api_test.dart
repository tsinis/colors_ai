import 'dart:ui';

import 'package:colors_ai/color_generator/interfaces/api.dart';
import 'package:colors_ai/color_generator/interfaces/colors_from_api.dart';
import 'package:colors_ai/color_generator/models/colors/colors_providers/colormind/colormind_colors.dart';
import 'package:colors_ai/core/extensions/color_palette_extension.dart';
import 'package:colors_ai/core/models/color_palette/color_palette.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';

import '../../data/mocks/http/mock_colormind_client.dart';
import 'data.dart';

class _APITest extends API<Color> {
  const _APITest(
    String host,
    ColorsFromAPI apiColors,
    String unlockedColorChar,
    String generateModelKey,
    String paletteInputKey,
    Client httpClient,
  ) : super(
          host,
          apiColors,
          generateModelKey: generateModelKey,
          paletteInputKey: paletteInputKey,
          unlockedColorChar: unlockedColorChar,
          httpClient: httpClient,
        );

  @override
  Color apiColorTransformer(Color color) => color;

  @override
  Future<ColorPalette> fetchNewColors(ColorPalette palette, List<bool> lockedColors) =>
      sendPostRequest(<String, String>{paletteInputKey: palette.toString()});
}

void main() => group('API', () {
      final MockColormindClient mockedClient = MockColormindClient();

      final List<bool> locks = mockedClient.generateLocks(
        lockedCount: (colors.length / 2).round(),
        overallLength: colors.length,
      );

      final API<Color> api = _APITest(
        host,
        const ColormindColors(),
        unlockedColorChar,
        generateModelKey,
        paletteInputKey,
        mockedClient,
      );

      test('isErrorStatusCode()', () {
        bool isErrorStatusCode = API.isErrorStatusCode(199);
        expect(isErrorStatusCode, true);
        isErrorStatusCode = API.isErrorStatusCode(300);
        expect(isErrorStatusCode, true);
        isErrorStatusCode = API.isErrorStatusCode(200);
        expect(isErrorStatusCode, false);
        isErrorStatusCode = API.isErrorStatusCode(299);
        expect(isErrorStatusCode, false);
      });

      test('sendPostRequest() with $FormatException on host parse', () async {
        final API<Color> testApi = _APITest(
          'https://^[',
          const ColormindColors(),
          unlockedColorChar,
          generateModelKey,
          paletteInputKey,
          mockedClient,
        );
        await expectLater(
          () async => testApi.fetchNewColors(colors.toPalette(), locks),
          throwsA(isA<FormatException>()),
        );
      });

      test('apiColorTransformer()', () => expect(api.apiColorTransformer(blackColor), blackColor));

      test('colorsToInput()', () {
        final MapEntry<String, List<Object>> entry = api.colorsToInput(colors.toPalette(), locks);
        expect(entry.key, paletteInputKey);
        expect(entry.value.length, colors.length);
        expect(entry.value.contains(unlockedColorChar), isTrue);
        expect(entry.value.last, blackColor);
      });

      test('modelToInput()', () {
        const String modelValue = 'modelValue';
        final MapEntry<String, String> model = api.modelToInput(modelValue);
        expect(model.key, generateModelKey);
        expect(model.value, modelValue);
      });

      test('fetchNewColors()', () async {
        final ColorPalette fetchedPalette = await api.fetchNewColors(colors.toPalette(), locks);
        expect(fetchedPalette.colors, isNotEmpty);
      });

      test('fetchNewColors() with Network $Error', () async {
        final MockColormindClient mockedErrorClient = MockColormindClient(statusCodeToReturn: 404);
        final API<Color> apiWithError = _APITest(
          host,
          const ColormindColors(),
          unlockedColorChar,
          generateModelKey,
          paletteInputKey,
          mockedErrorClient,
        );
        final Future<ColorPalette> fetchedPalette = apiWithError.fetchNewColors(colors.toPalette(), locks);
        await expectLater(fetchedPalette, throwsA(isA<Exception>()));
      });
    });
