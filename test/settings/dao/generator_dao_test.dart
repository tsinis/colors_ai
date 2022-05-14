import 'package:colors_ai/color_generator/interfaces/api.dart';
import 'package:colors_ai/color_generator/models/colors/constants.dart';
import 'package:colors_ai/color_generator/services/api/colormind/colormind_api.dart';
import 'package:colors_ai/core/extensions/color_palette_extension.dart';
import 'package:colors_ai/core/models/color_palette/color_palette.dart';
import 'package:colors_ai/core/models/typedef_aliases/int_rgb_color.dart';
import 'package:colors_ai/settings/dao/generator_dao.dart';
import 'package:colors_ai/settings/mixins/huemint_settings.dart';
import 'package:colors_ai/settings/models/selected_api.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../data/mocks/http/mock_colormind_client.dart';

void main() => group('$GeneratorDAO', () {
      late GeneratorDAO generatorDAO;

      setUp(() => generatorDAO = GeneratorDAO());

      test('default values', () {
        expect(generatorDAO.isDarkTheme, null);
        expect(generatorDAO.api, SelectedAPI.colormind);
        expect(generatorDAO.colormindForUI, isFalse);
        expect(generatorDAO.huemintAdjacency, HuemintSettings.adjacencyMax ~/ 2);
        expect(generatorDAO.huemintTemperature, HuemintSettings.temperatureMax / 2);
      });

      test('isDarkTheme', () {
        expect(generatorDAO.isDarkTheme, null);
        generatorDAO.isDarkTheme = false;
        expect(generatorDAO.isDarkTheme, false);
      });

      test('api', () {
        expect(generatorDAO.api, SelectedAPI.colormind);
        generatorDAO.api = SelectedAPI.huemint;
        expect(generatorDAO.api, SelectedAPI.huemint);
      });

      test('colormindForUI', () {
        expect(generatorDAO.colormindForUI, isFalse);
        generatorDAO.colormindForUI = true;
        expect(generatorDAO.colormindForUI, isTrue);
      });

      test('huemintAdjacency', () {
        expect(generatorDAO.huemintAdjacency, HuemintSettings.adjacencyMax ~/ 2);
        generatorDAO.huemintAdjacency = 0;
        expect(generatorDAO.huemintAdjacency, 0);
      });

      test('huemintTemperature', () {
        expect(generatorDAO.huemintTemperature, HuemintSettings.temperatureMax / 2);
        generatorDAO.huemintTemperature = 0;
        expect(generatorDAO.huemintTemperature, 0);
      });

      test('fetchNewColors()', () async {
        final MockColormindClient mockedClient = MockColormindClient();
        final API<IntRGBColor> api = ColormindAPI(httpClient: mockedClient, forUI: true);
        final ColorPalette fetchedColors = await generatorDAO.fetchNewColors(
          kDefaultColors.toPalette(),
          mockedClient.generateLocks(),
          specificAPI: api,
        );

        expect(fetchedColors.colors, isNotEmpty);
      });

      test('fetchNewColors() without specific API (use default)', () async {
        final MockColormindClient mockedClient = MockColormindClient();
        final ColorPalette fetchedColors = await generatorDAO.fetchNewColors(
          kDefaultColors.toPalette(),
          mockedClient.generateLocks(),
        );

        expect(fetchedColors.colors, isNotEmpty);
      });

      test('fetchNewColors() without specific API (use non-default)', () async {
        final MockColormindClient mockedClient = MockColormindClient();
        final ColorPalette fetchedColors = await GeneratorDAO(api: SelectedAPI.huemint).fetchNewColors(
          kDefaultColors.toPalette(),
          mockedClient.generateLocks(),
        );

        expect(fetchedColors.colors, isNotEmpty);
      });

      test('fetchNewColors() with Network error', () async {
        final MockColormindClient mockedClient = MockColormindClient(statusCodeToReturn: 404);
        final API<IntRGBColor> api = ColormindAPI(httpClient: mockedClient, forUI: true);
        final Future<ColorPalette> fetchedPalette = generatorDAO.fetchNewColors(
          kDefaultColors.toPalette(),
          mockedClient.generateLocks(),
          specificAPI: api,
        );

        await expectLater(fetchedPalette, throwsA(isA<Exception>()));
      });
    });
