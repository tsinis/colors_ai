import 'dart:ui' show Color;

import 'package:flutter/services.dart' show Clipboard, ClipboardData;

import '../extensions/color_to_hex.dart';

class Clipboards {
  const Clipboards();
  Future<void> copyUrl(String url) async => Clipboard.setData(ClipboardData(text: url));

  Future<void> copyColor(Color color) async => Clipboard.setData(ClipboardData(text: color.toHex()));

  Future<String?> get data async => (await Clipboard.getData('text/plain'))?.text;
}
