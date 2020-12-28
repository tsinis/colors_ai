import 'dart:ui' show Color;

extension ColorExtension on List<int> {
  Color toColor() => (length == 3) ? Color.fromRGBO(first, this[1], last, 1) : const Color.fromRGBO(0, 0, 0, 0);
}
