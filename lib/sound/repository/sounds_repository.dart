import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../mixins/vibration.dart';
import '../models/sounds/constants.dart';
import '../models/sounds/sounds_audio.dart';

class SoundsRepository with Vibrations {
  static const SoundsSource _sounds = SoundsSource();
  final AudioPlayer _player = AudioPlayer();

  Future<void> _playSound(String soundName, {double volume = 0.4}) async {
    if (Platform.isAndroid) {
      try {
        await _player.setVolume(volume);
        await _player.setAsset(_sounds.assetPath(soundName));
        await _player.play().whenComplete(_player.stop);
      } on Exception catch (e) {
        debugPrint('Exception during audio playback $e');
        rethrow;
      }
    }
  }

  void playLock() => _playSound(lock);
  void playRefresh() => _playSound(refresh);
  void playCopy() => _playSound(notificationHigh, volume: 0.1);
  void playFavoritesAdded() => _playSound(notificationSimple, volume: 0.1);
}
