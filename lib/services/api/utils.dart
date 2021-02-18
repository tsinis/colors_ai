import 'constants.dart';

String colorsToInput(List<List<int>> colorslist, {required List<bool> lockedColors}) {
  final StringBuffer sb = StringBuffer()..write(startSquareBracket);
  for (final List<int> color in colorslist) {
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
