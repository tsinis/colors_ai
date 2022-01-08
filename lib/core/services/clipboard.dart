import 'dart:ui' show Color;

import 'package:flutter/services.dart' show Clipboard, ClipboardData;

import '../extensions/color_extensions.dart';

class ClipBoard {
  final String _dataFormat;

  Future<String?> get data async => (await Clipboard.getData(_dataFormat))?.text;

  const ClipBoard({String dataFormat = Clipboard.kTextPlain}) : _dataFormat = dataFormat;

  Future<void> copyColor(Color? color) => copyTextData(color?.toHex());

  Future<void> copyTextData(String? text) async {
    if (text == null || text.isEmpty) {
      return;
    }

    return Clipboard.setData(ClipboardData(text: text));
  }
}
