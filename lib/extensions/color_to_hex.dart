import 'dart:ui';

extension ColorHex on Color {
  String toHex() => (value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase();
}
