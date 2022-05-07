import 'dart:ui' show Color;

import 'package:colors_ai/core/extensions/color_extensions.dart';
import 'package:colors_ai/core/services/clipboard.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeClipboard extends Fake implements ClipBoard {
  final bool throwExceptionOnCopy;
  final bool throwExceptionOnPaste;
  String? _clipboardData;

  @override
  Future<String?> get data async {
    if (throwExceptionOnPaste) {
      throw Exception('Paste error.');
    }

    return _clipboardData;
  }

  FakeClipboard({this.throwExceptionOnCopy = false, this.throwExceptionOnPaste = false});

  @override
  Future<void> copyColor([Color? color]) => copyTextData(color?.toHex());

  @override
  Future<void> copyTextData([String? text]) async {
    if (text == null || text.isEmpty) {
      return;
    } else if (throwExceptionOnCopy) {
      throw Exception('Copy error.');
    }

    _clipboardData = text;
  }
}
