import 'package:flutter/foundation.dart';

import '../mixins/vibrations.dart';
import '../models/sound.dart';
import '../models/sounds_source.dart';
import '../services/sounds_player.dart';

class SoundsRepository with Vibrations {
  final SoundsSource sounds;
  late final SoundsPlayer _player;

  SoundsRepository({this.sounds = const SoundsSource(), SoundsPlayer? player}) {
    _player = player ?? SoundsPlayer();
  }

  void playCopy() => _playSound(Sound.notificationHigh);
  void playFavoritesAdded() => _playSound(Sound.notificationSimple);
  void playLock() => _playSound(Sound.lock, volume: 0.8);
  void playRefresh() => _playSound(Sound.refresh, volume: 0.6);

  Future<void> init() async {
    await initVibrations();
    try {
      await _playSound(Sound.notificationSimple, cacheOnly: true);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      debugPrint('Error during audio cache: $e');
    }
  }

  Future<void> _playSound(Sound sound, {double volume = 0.1, bool cacheOnly = false}) async {
    final String asset = sounds.asset(sound);
    try {
      await _player.playSound(asset, volume, cacheOnly: cacheOnly);
    } on Exception catch (e) {
      debugPrint('Exception during audio playback $e');
    }
  }
}
