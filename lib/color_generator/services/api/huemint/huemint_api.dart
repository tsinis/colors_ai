import 'dart:convert';
import 'dart:math' show pow;
import 'dart:ui';

import 'package:flutter_colorpicker/flutter_colorpicker.dart' show colorToHex;

import '../../../../core/models/color_palette/color_palette.dart';
import '../../../interfaces/api.dart';
import '../../../models/colors/colors_providers/huemint/huemint_colors.dart';

class HuemintAPI extends API<String> {
  const HuemintAPI() : super('https://api.huemint.com/color', const HuemintColors(), unlockedColorChar: '-');

  @override
  String apiColorTransformer(Color color) =>
      colorToHex(color, enableAlpha: false, includeHashSign: true, toUpperCase: false);

  @override
  Future<ColorPalette> fetchNewColors(
    ColorPalette palette, {
    List<bool> lockedColors = const <bool>[],
    bool forUI = false,
  }) async {
    final List<bool> invertedLocks = lockedColors.map((bool isLocked) => !isLocked).toList(growable: false);
    const int numResults = 5;
    //TODO? Allow to change in settings maybe?
    const double temperature = 1.2;
    const String mode = 'transformer';
    const int adjacency = 36;
    const int numColors = numResults;
    final List<int> matrix = List<int>.filled(pow(numColors, 2).toInt(), adjacency);
    final Map<String, Object> map = <String, Object>{
      'mode': mode,
      'num_colors': numColors,
      'temperature': temperature,
      'num_results': numResults,
      'adjacency': matrix,
      'palette': <String>['-', '-', '-', '-'],
    };
    final String body = jsonEncode(map);

    return sendPostRequest(body);
  }
}
