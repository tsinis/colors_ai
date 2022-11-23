import 'dart:async';

import 'package:vibration/vibration.dart';

class Vibrations {
  final bool hasCustomVibrationsSupport;

  const Vibrations._({required this.hasCustomVibrationsSupport});

  static Future<Vibrations> init() async {
    try {
      final bool hasBasicVibrator = await Vibration.hasVibrator() ?? false;
      final bool hasExtenderVibrator = await Vibration.hasCustomVibrationsSupport() ?? false;

      return Vibrations._(hasCustomVibrationsSupport: hasBasicVibrator && hasExtenderVibrator);
    } catch (_) {
      return const Vibrations._(hasCustomVibrationsSupport: false);
    }
  }

  void vibrate({int durationInMs = 150}) {
    if (hasCustomVibrationsSupport) {
      unawaited(Vibration.vibrate(duration: durationInMs));
    }
  }
}
