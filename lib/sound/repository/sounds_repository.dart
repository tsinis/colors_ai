import 'package:flutter/foundation.dart';

import '../mixins/vibrations.dart';
import '../models/sounds/sound.dart';
import '../models/sounds/sounds_source.dart';
import '../services/sounds_player.dart';

class SoundsRepository with Vibrations {
  final SoundsSource sounds;
  late final SoundsPlayer? _player;

  SoundsRepository({this.sounds = const SoundsSource(), SoundsPlayer? player}) {
    _player = player ?? SoundsPlayer();
  }

  void playCopy() => _playSound(Sound.notificationHigh);
  void playFavoritesAdded() => _playSound(Sound.notificationSimple);
  void playLock() => _playSound(Sound.lock, volume: 0.8);
  void playRefresh() => _playSound(Sound.refresh, volume: 0.6);

  Future<void> init() async {
    await initVibrations();
    await _playSound(Sound.notificationSimple, cacheOnly: true);
  }

  Future<void> _playSound(Sound sound, {double volume = 0.1, bool cacheOnly = false}) async {
    final String asset = sounds.asset(sound);
    try {
      await _player?.playSound(asset, volume, cacheOnly: cacheOnly);
    } on Exception catch (e) {
      debugPrint('Exception during audio playback $e');
      rethrow;
    }
  }
}
