import 'package:color_converter/color_converter.dart';

import '../models/color_space.dart';

// ignore: prefer-static-class, doesn't make sense for a single method.
String colorSpaceConverter(ColorSpace space, String hex) {
  switch (space) {
    case ColorSpace.rgb:
      return hexToRgb(hex).toString();
    case ColorSpace.cmyk:
      final CMYK cmyk = hexToCmyk(hex);
      return '${cmyk.c}, ${cmyk.m}, ${cmyk.y}, ${cmyk.k}';
    case ColorSpace.hsb:
      final HSB hsb = hexToHsb(hex);
      return '${hsb.h}, ${hsb.s}, ${hsb.b}';
    case ColorSpace.hsl:
      final HSL hsl = hexToHsl(hex);
      return '${hsl.h}, ${hsl.s}, ${hsl.l}';
    case ColorSpace.lab:
      final LAB lab = hexToLab(hex);
      return '${lab.l}, ${lab.a}, ${lab.b}';
    case ColorSpace.xyz:
      final XYZ xyz = hexToXyz(hex);
      return '${xyz.x.toStringAsFixed(2)}, ${xyz.y.toStringAsFixed(2)}, ${xyz.z.toStringAsFixed(2)}';
    case ColorSpace.hex:
      return hex;
  }
}
