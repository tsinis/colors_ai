import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';

import '../mixins/vibrations.dart';
import '../models/sounds/sound.dart';
import '../models/sounds/sounds_source.dart';

class SoundsRepository with Vibrations {
  final SoundsSource sounds;

  final AudioPlayer _player = AudioPlayer();

  SoundsRepository({this.sounds = const SoundsSource()});

  void playCopy() => _playSound(Sound.notificationHigh);

  void playFavoritesAdded() => _playSound(Sound.notificationSimple);

  void playLock() => _playSound(Sound.lock, volume: 0.8);

  void playRefresh() => _playSound(Sound.refresh, volume: 0.6);

  Future<void> _playSound(Sound sound, {double volume = 0.1}) async {
    if (kIsWeb || Platform.isAndroid || Platform.isIOS || Platform.isMacOS) {
      try {
        await _player.setVolume(volume);
        await _player.setAsset(sounds.asset(sound));
        await _player.play();
        await _player.stop();
      } on Exception catch (e) {
        debugPrint('Exception during audio playback $e');
        rethrow;
      }
    }
  }
}
