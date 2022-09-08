import 'dart:async';

import 'package:flutter/foundation.dart';

import '../mixins/vibrations.dart';
import '../models/sound.dart';
import '../services/sounds_player.dart';

class SoundsRepository {
  late final Vibrations _vibrations;
  late final SoundsPlayer _player;

  SoundsRepository({
    SoundsPlayer? player,
    Vibrations? vibrations,
  }) {
    _player = player ?? SoundsPlayer();
    _vibrations = vibrations ?? Vibrations();
  }

  void playFavoritesAdded() {
    unawaited(_playSound(Sound.notificationSimple));
    _vibrations.vibrate();
  }

  Future<void> playCopy() => _playSound(Sound.notificationHigh);
  Future<void> playLock() => _playSound(Sound.lock, volume: 0.8);
  Future<void> playRefresh() => _playSound(Sound.refresh, volume: 0.6);

  Future<void> init() async {
    await _vibrations.init();
    final Set<String> assetsToCache = Set<String>.unmodifiable(Sound.values.map<String>((Sound sound) => sound.asset));
    await _playSound(Sound.notificationSimple, cachedAssets: assetsToCache);
  }

  Future<void> _playSound(Sound sound, {double volume = 0.1, Set<String>? cachedAssets}) async {
    try {
      await _player.playSound(sound.asset, volume, cachedFileNames: cachedAssets?.toList());
    } catch (e) {
      debugPrint('Exception during audio playback $e');
    }
  }
}
