import 'package:flutter/services.dart';

class ClipboardMock {
  Map<String, Object?> _clipboardData = <String, Object?>{
    'text': null,
  };

  ClipboardMock({Map<String, dynamic>? clipboardData}) {
    if (clipboardData != null) {
      _clipboardData = clipboardData;
    }
  }

  Future<Map<String, Object?>?> handleMethodCall(MethodCall methodCall) async {
    switch (methodCall.method) {
      case 'Clipboard.getData':
        return _clipboardData;
      case 'Clipboard.setData':
        _clipboardData = methodCall.arguments as Map<String, Object?>;
    }

    return null;
  }
}
