// ignore: import_of_legacy_library_into_null_safe
import 'package:just_audio/just_audio.dart';
import '../models/sounds/constants.dart';
import '../models/sounds/sounds_audio.dart';

class SoundsAssets {
  const SoundsAssets();

  static final AudioPlayer _player = AudioPlayer();
  static const SoundsSource _sounds = SoundsSource();

  // Future<void> get initial async =>
  //     await _player.setAudioSource(_sounds.source, initialIndex: soundsList.length - 1).whenComplete(_player.play);

  Future<void> _playSound(String soundName) async {
    try {
      await _player.setAsset(_sounds.assetPath(soundName)).whenComplete(_player.play).whenComplete(_player.stop);
      // ignore: avoid_catches_without_on_clauses
    } catch (_) {}
  }

  void get playLock => _playSound(lock);
  void get playRefresh => _playSound(refresh);
  void get playCopy => _playSound(notificationHigh);
  void get playSaved => _playSound(notificationSimple2);
  void get playSwipeLeft => _playSound(transitionLeft);
  void get playSwipeRight => _playSound(transitionRight);
}
