import 'dart:math' show pow;
import 'dart:ui';

import 'package:flutter_colorpicker/flutter_colorpicker.dart' show colorToHex;
import 'package:http/http.dart' show Client;

import '../../../../core/models/color_palette/color_palette.dart';
import '../../../interfaces/api.dart';
import '../../../models/colors/colors_providers/huemint/huemint_colors.dart';

class HuemintAPI extends API<String> {
  final int adjacency;
  final String adjacencyKey;
  final String generateModelValue;
  final String numColorsKey;
  final int numColorsValue;
  final double temperature;
  final String temperatureKey;

  const HuemintAPI({
    required this.adjacency,
    required this.temperature,
    this.numColorsValue = 5,
    this.adjacencyKey = 'adjacency',
    this.numColorsKey = 'num_colors',
    this.temperatureKey = 'temperature',
    this.generateModelValue = 'transformer',
    Client? httpClient,
  }) : super(
          'https://api.huemint.com/color',
          const HuemintColors(),
          unlockedColorChar: '-',
          generateModelKey: 'mode',
          paletteInputKey: 'palette',
          httpClient: httpClient,
        );

  @override
  String apiColorTransformer(Color color) =>
      colorToHex(color, enableAlpha: false, includeHashSign: true, toUpperCase: false);

  @override
  Future<ColorPalette> fetchNewColors(ColorPalette palette, List<bool> lockedColors) {
    final List<int> matrix = List<int>.filled(pow(numColorsValue, 2).toInt(), adjacency);

    final Map<String, Object> requestBody = <String, Object>{
      numColorsKey: numColorsValue,
      temperatureKey: temperature,
      adjacencyKey: matrix,
      'num_results': 5, // Using only first one.
    }..addEntries(<MapEntry<String, String>>[modelToInput(generateModelValue)]);

    final List<bool> invertedLocks = lockedColors.map((bool isLocked) => !isLocked).toList(growable: false);
    final MapEntry<String, List<Object>> colorsEntry = colorsToInput(palette, invertedLocks);

    requestBody.addEntries(<MapEntry<String, Object>>[colorsEntry]);

    return sendPostRequest(requestBody);
  }
}
