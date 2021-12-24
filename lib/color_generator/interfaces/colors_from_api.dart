import 'dart:ui' show Color;

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Response;

import '../../core/extensions/color_palette_extension.dart';
import '../../core/models/color_palette/color_palette.dart';

abstract class ColorsFromAPI {
  final List<Color> _colors;

  @protected
  ColorPalette get asPalette => _colors.toPalette();

  const ColorsFromAPI(this._colors);

  @required
  ColorPalette fromResponse(Response response);
}
