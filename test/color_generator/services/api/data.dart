import 'dart:ui';

import 'package:colors_ai/core/models/typedef_aliases/int_rgb_color.dart';

const Color blackColor = Color(0xFF000000);
const List<Color> colors = <Color>[blackColor, blackColor];

/// Colormind API part:
const String colormindUnlockedChar = '&';
const String colormindModelKey = 'modelKey';
const String colormindPaletteInputKey = 'inputKey';
const IntRGBColor blackColorAsIntRGBColor = <int>[0, 0, 0];

/// Huemint API part:
const double temperature = 0;
const int adjacency = 0;
const String huemintUnlockedChar = '-';
const String huemintModelKey = 'mode';
const String huemintPaletteInputKey = 'palette';
const String blackColorAsHexColor = '#000000';
