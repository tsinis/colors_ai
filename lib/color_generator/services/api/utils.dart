import '../../../core/models/typedef_aliases/int_rgb_color.dart';

import 'constants.dart';

String colorsToInput(List<IntRGBColor> colorslist, {required List<bool> lockedColors}) {
  final StringBuffer sb = StringBuffer(startSquareBracket);
  for (final IntRGBColor color in colorslist) {
    final int colorIndex = colorslist.indexOf(color);
    if (lockedColors[colorIndex]) {
      sb.write(unlockedColor);
    } else {
      sb.write(color);
    }
    if (colorIndex != colorslist.length - 1) {
      sb.write(comma);
    }
  }

  sb.write(endSquareBracket + comma);
  return sb.toString().replaceAll(' ', '');
}
