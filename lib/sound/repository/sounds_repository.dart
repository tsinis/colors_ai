import 'dart:io' show Platform;

import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';

import '../mixins/vibrations.dart';
import '../models/sounds/sound.dart';
import '../models/sounds/sounds_source.dart';

class SoundsRepository with Vibrations {
  final SoundsSource sounds;
  late final bool _isWindowsOrLinux;
  final AudioPlayer _player = AudioPlayer();
  late final Player? _vlcPlayer;

  SoundsRepository({this.sounds = const SoundsSource(), bool? useVLC}) {
    _isWindowsOrLinux = useVLC ?? !kIsWeb && (Platform.isWindows || Platform.isLinux);
  }

  void playCopy() => _playSound(Sound.notificationHigh);
  void playFavoritesAdded() => _playSound(Sound.notificationSimple);
  void playLock() => _playSound(Sound.lock, volume: 0.8);
  void playRefresh() => _playSound(Sound.refresh, volume: 0.6);

  Future<void> init() async {
    await initVibrations();
    if (_isWindowsOrLinux) {
      DartVLC.initialize();
      _vlcPlayer = Player(id: 0, commandlineArguments: <String>['--no-video']);
    }
    await _playSound(Sound.notificationSimple, cacheOnly: true);
  }

  Future<void> _playSound(Sound sound, {double volume = 0.1, bool cacheOnly = false}) async {
    final String asset = sounds.asset(sound);
    try {
      if (_isWindowsOrLinux) {
        _vlcPlayer?.setVolume(volume);
        _vlcPlayer?.open(Media.asset(asset), autoStart: false);
        if (!cacheOnly) {
          _vlcPlayer?.play();
        }
      } else {
        await _player.setVolume(volume);
        await _player.setAsset(asset);
        if (cacheOnly) {
          await _player.play();
          await _player.pause();
        }
      }
    } on Exception catch (e) {
      debugPrint('Exception during audio playback $e');
      rethrow;
    }
  }
}
