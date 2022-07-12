import 'package:flutter/services.dart';

class VibrationsMock {
  static const MethodChannel channel = MethodChannel('vibration');

  final bool hasCustomVibrationsSupport;
  final bool hasVibrator;

  const VibrationsMock({this.hasVibrator = true, this.hasCustomVibrationsSupport = false});

  Future<bool?> handleMethodCall(MethodCall methodCall) async {
    switch (methodCall.method) {
      case 'hasVibrator':
        return hasVibrator;
      case 'hasCustomVibrationsSupport':
        return hasCustomVibrationsSupport;
    }

    return null;
  }
}
