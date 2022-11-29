import 'dart:async';

import 'package:flutter/foundation.dart';

import '../models/sound.dart';
import '../services/sounds_player.dart';

class SoundsRepository {
  late final SoundsPlayer _player;

  SoundsRepository({SoundsPlayer? player}) {
    _player = player ?? SoundsPlayer();
  }

  void playFavoritesAdded() => unawaited(_playSound(Sound.notificationSimple));

  FutureOr<void> playCopy() => _playSound(Sound.notificationHigh);
  FutureOr<void> playLock() => _playSound(Sound.lock, volume: 0.8);
  FutureOr<void> playRefresh() => _playSound(Sound.refresh, volume: 0.6);

  Future<void> init() async {
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
