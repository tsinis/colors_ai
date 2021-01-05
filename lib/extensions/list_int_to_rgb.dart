import 'dart:ui' show Color;

extension ColorExtension on List<int> {
  Color toColor() =>
      (length == 3) ? Color.fromRGBO(this[_red], this[_green], this[_blue], 1) : const Color.fromRGBO(128, 128, 128, 1);
  Color contrastColor() {
    // Lightness formula https://en.wikipedia.org/wiki/HSL_and_HSV#Lightness
    final double darkness = 1 - (0.299 * this[_red] + 0.587 * this[_green] + 0.114 * this[_blue]) / 255;
    return (darkness < 0.5) ? const Color.fromRGBO(0, 0, 0, 0.6) : const Color.fromRGBO(255, 255, 255, 0.6);
  }
}

const int _red = 0, _green = 1, _blue = 2;
