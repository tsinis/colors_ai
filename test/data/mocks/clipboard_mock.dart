import 'package:flutter/services.dart';

class ClipboardMock {
  Map<String, dynamic> _clipboardData = <String, dynamic>{
    'text': null,
  };

  ClipboardMock({Map<String, dynamic>? clipboardData}) {
    if (clipboardData != null) {
      _clipboardData = clipboardData;
    }
  }

  Future<dynamic> handleMethodCall(MethodCall methodCall) async {
    switch (methodCall.method) {
      case 'Clipboard.getData':
        return _clipboardData;
      case 'Clipboard.setData':
        _clipboardData = methodCall.arguments as Map<String, dynamic>;
    }
  }
}
