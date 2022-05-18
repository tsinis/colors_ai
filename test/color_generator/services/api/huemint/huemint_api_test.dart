import 'package:colors_ai/color_generator/services/api/huemint/huemint_api.dart';
import 'package:colors_ai/core/extensions/color_palette_extension.dart';
import 'package:colors_ai/core/models/color_palette/color_palette.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../data/mocks/http/mock_huemint_client.dart';
import '../data.dart';

void main() => group('$HuemintAPI', () {
      final MockHuemintClient mockedClient = MockHuemintClient();
      late HuemintAPI huemintAPI;

      final List<bool> locks = mockedClient.generateLocks(
        lockedCount: (colors.length / 2).round(),
        overallLength: colors.length,
      );

      setUp(
        () => huemintAPI = HuemintAPI(
          httpClient: mockedClient,
          adjacency: adjacency,
          temperature: temperature,
        ),
      );

      test('apiColorTransformer()', () {
        final String transformedColor = huemintAPI.apiColorTransformer(blackColor);
        expect(transformedColor, blackColorAsHexColor);
      });

      test('colorsToInput()', () {
        final MapEntry<String, List<Object>> entry = huemintAPI.colorsToInput(colors.toPalette(), locks);
        expect(entry.key, huemintPaletteInputKey);
        expect(entry.value.length, colors.length);
        expect(entry.value.contains(huemintUnlockedChar), isTrue);
        expect(entry.value.last, blackColorAsHexColor);
      });

      test('modelToInput()', () {
        const String modelValue = 'modelValue';
        final MapEntry<String, String> model = huemintAPI.modelToInput(modelValue);
        expect(model.key, huemintModelKey);
        expect(model.value, modelValue);
      });

      test('fetchNewColors()', () async {
        final ColorPalette fetchedPalette = await huemintAPI.fetchNewColors(colors.toPalette(), locks);
        expect(fetchedPalette.colors, isNotEmpty);
      });

      test('fetchNewColors() with Network $Error', () async {
        final MockHuemintClient mockedClient = MockHuemintClient(statusCodeToReturn: 404);
        final HuemintAPI colormindApiWithError = HuemintAPI(
          httpClient: mockedClient,
          adjacency: adjacency,
          temperature: temperature,
        );
        final Future<ColorPalette> fetchedPalette = colormindApiWithError.fetchNewColors(colors.toPalette(), locks);
        await expectLater(fetchedPalette, throwsA(isA<Exception>()));
      });
    });
