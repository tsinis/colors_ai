// Ignored because JSON can have dynamic content
// ignore_for_file: avoid-dynamic
import 'dart:ui' show Color;

import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/models/typedef_aliases/int_rgb_color.dart';

class ColormindColorsConverter implements JsonConverter<List<Color>, List<dynamic>> {
  const ColormindColorsConverter();

  @override
  // Ignored because JSON can have dynamic content
  // ignore: avoid_annotating_with_dynamic
  List<Color> fromJson(List<dynamic> rgbs) => rgbs.map<Color>((dynamic rgb) {
        if (rgb is! List) {
          throw Exception('Colors from Colormind API are not in List.');
        }

        return (rgb.length == 3)
            ? Color.fromRGBO(rgb.first as int, rgb[1] as int, rgb.last as int, 1)
            : const Color(0xffffffff);
      }).toList(growable: false);

  @override
  List<IntRGBColor> toJson(List<Color> colors) => colors.map<IntRGBColor>((Color color) => color.toListInt()).toList();
}
