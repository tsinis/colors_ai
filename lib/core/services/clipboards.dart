import 'dart:ui' show Color;

import 'package:flutter/services.dart' show Clipboard, ClipboardData;

import '../extensions/color.dart';

class Clipboards {
  const Clipboards();

  Future<void> copyTextData(String text) async => Clipboard.setData(ClipboardData(text: text));

  Future<void> copyUrl(String url) async => copyTextData(url);

  Future<void> copyColor(Color color) async => Clipboard.setData(ClipboardData(text: color.toHex()));

  Future<String?> get data async => (await Clipboard.getData(Clipboard.kTextPlain))?.text;
}
