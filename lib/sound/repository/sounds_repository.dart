import 'package:flutter/foundation.dart';

import '../mixins/vibrations.dart';
import '../models/sound.dart';
import '../models/sounds_source.dart';
import '../services/sounds_player.dart';

class SoundsRepository {
  final SoundsSource sounds;
  late final Vibrations _vibrations;
  late final SoundsPlayer _player;

  SoundsRepository({
    this.sounds = const SoundsSource(),
    SoundsPlayer? player,
    Vibrations? vibrations,
  }) {
    _player = player ?? SoundsPlayer();
    _vibrations = vibrations ?? Vibrations();
  }

  void playFavoritesAdded() {
    _playSound(Sound.notificationSimple);
    _vibrations.vibrate();
  }

  void playCopy() => _playSound(Sound.notificationHigh);
  void playLock() => _playSound(Sound.lock, volume: 0.8);
  void playRefresh() => _playSound(Sound.refresh, volume: 0.6);

  Future<void> init() async {
    await _vibrations.init();
    const List<Sound> cache = <Sound>[Sound.lock, Sound.refresh, Sound.notificationHigh, Sound.notificationSimple];
    final List<String> assetsToCache = List<String>.unmodifiable(cache.map<String>(sounds.asset));
    await _playSound(Sound.notificationSimple, cachedAssets: assetsToCache);
  }

  Future<void> _playSound(Sound sound, {double volume = 0.1, List<String>? cachedAssets}) async {
    final String asset = sounds.asset(sound);
    try {
      await _player.playSound(asset, volume, cachedFileNames: cachedAssets);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      debugPrint('Exception during audio playback $e');
    }
  }
}
