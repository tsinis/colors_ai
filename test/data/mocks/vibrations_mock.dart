import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

class VibrationsMock {
  static const String vibrateCall = 'vibrate';
  static const String hasVibratorCall = 'hasVibrator';
  static const String hasCustomVibrationsSupportCall = 'hasCustomVibrationsSupport';

  final bool hasCustomVibrationsSupport;
  final bool hasVibrator;
  final List<String> _calls;

  int get timesVibrated => _callsCount();

  VibrationsMock({this.hasVibrator = true, this.hasCustomVibrationsSupport = false}) : _calls = <String>[] {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(const MethodChannel('vibration'), _handleMethodCall);
  }

  int _callsCount([String methodName = vibrateCall]) => _calls.where((String call) => call == methodName).length;

  Future<bool?> _handleMethodCall(MethodCall methodCall) async {
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
