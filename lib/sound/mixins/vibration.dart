import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:vibration/vibration.dart';

mixin Vibrations {
  late final bool customVibrationsAvailible;
  Future<void> init() async {
    if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
      customVibrationsAvailible =
          (await Vibration.hasVibrator() == true) && (await Vibration.hasCustomVibrationsSupport() == true);
    } else {
      customVibrationsAvailible = false;
    }
  }

  void vibrate() {
    if (customVibrationsAvailible) {
      Vibration.vibrate(duration: 150);
    }
  }
}
