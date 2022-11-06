import 'package:flutter/services.dart';

class VibrationsMock {
  static const MethodChannel channel = MethodChannel('vibration');
  static const String vibrateCall = 'vibrate';
  static const String hasVibratorCall = 'hasVibrator';
  static const String hasCustomVibrationsSupportCall = 'hasCustomVibrationsSupport';

  final bool hasCustomVibrationsSupport;
  final bool hasVibrator;
  final List<String> _calls;

  VibrationsMock({this.hasVibrator = true, this.hasCustomVibrationsSupport = false}) : _calls = <String>[];

  int calls([String methodName = vibrateCall]) => _calls.where((String call) => call == methodName).length;

  Future<bool?> handleMethodCall(MethodCall methodCall) async {
    _calls.add(methodCall.method);
    switch (methodCall.method) {
      case hasVibratorCall:
        return hasVibrator;
      case hasCustomVibrationsSupportCall:
        return hasCustomVibrationsSupport;
    }

    return null;
  }
}
