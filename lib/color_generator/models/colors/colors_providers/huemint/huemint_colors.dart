import 'dart:convert';
import 'dart:ui';

import 'package:flutter_colorpicker/flutter_colorpicker.dart' show colorFromHex;
import 'package:http/http.dart';

import '../../../../../core/models/color_palette/color_palette.dart';
import '../../../../interfaces/colors_from_api.dart';

class HuemintColors extends ColorsFromAPI {
  const HuemintColors({List<Color> colors = const <Color>[]}) : super(colors);

  factory HuemintColors.fromJson(Map<String, dynamic> json) {
    // ignore: avoid_dynamic_calls
    final List<dynamic> stringColors = json['results'].first['palette'] as List<dynamic>;
    final Iterable<Color?> maybeColors =
        // ignore: avoid_annotating_with_dynamic
        stringColors.map((dynamic hex) => colorFromHex(hex.toString(), enableAlpha: false));

    return HuemintColors(colors: List<Color>.unmodifiable(maybeColors.whereType<Color>()));
  }

  @override
  ColorPalette fromResponse(Response response) {
    final Map<String, dynamic> responseMap = jsonDecode(response.body) as Map<String, dynamic>;

    return HuemintColors.fromJson(responseMap).asPalette;
  }
}
