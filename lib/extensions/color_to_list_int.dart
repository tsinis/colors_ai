import 'dart:ui' show Color;

extension ColorListInt on Color {
  List<int> toListInt() => [red, green, blue];
}
