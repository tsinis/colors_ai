import 'dart:ui' show Color;

import 'package:http/http.dart' show Response;

import '../../core/models/color_palette/color_palette.dart';
import 'color_palette_interface.dart';
import 'manipulate_list_interface.dart';

abstract class ColorsFromAPI implements ManipulateListInterface<Color>, ColorPaletteInterface {
  const ColorsFromAPI();

  void change(int colorIndex, Color newColor);

  ColorPalette fromResponse(Response response);
}
