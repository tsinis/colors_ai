import 'package:colors_ai/color_generator/services/api/colormind/colormind_api.dart';
import 'package:colors_ai/core/extensions/color_palette_extension.dart';
import 'package:colors_ai/core/models/color_palette/color_palette.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../data/mocks/http/mock_colormind_client.dart';
import '../data.dart';

void main() => group('$ColormindAPI', () {
      final MockColormindClient mockedClient = MockColormindClient();
      late ColormindAPI colormindAPI;

      final List<bool> locks = mockedClient.generateLocks(
        lockedCount: (colors.length / 2).round(),
        overallLength: colors.length,
      );

      setUp(
        () => colormindAPI = ColormindAPI(
          unlockedColorChar: colormindUnlockedChar,
          paletteInputKey: colormindPaletteInputKey,
          generateModelKey: colormindModelKey,
          httpClient: mockedClient,
          forUI: false,
        ),
      );

      test('apiColorTransformer()', () {
        final List<int> transformedColor = colormindAPI.apiColorTransformer(blackColor);
        expect(transformedColor, blackColorAsIntRGBColor);
      });

      test('colorsToInput()', () {
        final MapEntry<String, List<Object>> entry = colormindAPI.colorsToInput(colors.toPalette(), locks);
        expect(entry.key, colormindPaletteInputKey);
        expect(entry.value.length, colors.length);
        expect(entry.value.contains(colormindUnlockedChar), isTrue);
        expect(entry.value.last, blackColorAsIntRGBColor);
      });

      test('modelToInput()', () {
        const String modelValue = 'modelValue';
        final MapEntry<String, String> model = colormindAPI.modelToInput(modelValue);
        expect(model.key, colormindModelKey);
        expect(model.value, modelValue);
      });

      test('fetchNewColors()', () async {
        final ColorPalette fetchedPalette = await colormindAPI.fetchNewColors(colors.toPalette(), locks);
        expect(fetchedPalette.colors, isNotEmpty);
      });

      test('fetchNewColors() with Network $Error', () async {
        final MockColormindClient mockedClient = MockColormindClient(statusCodeToReturn: 404);
        final ColormindAPI colormindApiWithError = ColormindAPI(httpClient: mockedClient, forUI: true);
        final Future<ColorPalette> fetchedPalette = colormindApiWithError.fetchNewColors(colors.toPalette(), locks);
        await expectLater(fetchedPalette, throwsA(isA<Exception>()));
      });
    });
