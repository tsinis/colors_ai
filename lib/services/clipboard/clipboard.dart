import 'dart:ui' show Color;

import 'package:flutter/services.dart' show Clipboard, ClipboardData;

import '../../extensions/color_to_hex.dart';

class Clipboards {
  const Clipboards();
  Future<void> copyURL(String url) async => await Clipboard.setData(ClipboardData(text: url));

  Future<String> copyColor(Color color) async {
    final String colorAsHexString = color.toHex();
    await Clipboard.setData(ClipboardData(text: colorAsHexString));
    return colorAsHexString;
  }
}
