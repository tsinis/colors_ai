import 'dart:io';

import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';

class SoundsPlayer {
  bool _isPlaybackCompleted = true;
  late final bool _isWindowsOrLinux;
  final AudioPlayer _justAudioPlayer = AudioPlayer();
  late final Player? _vlcPlayer;

  SoundsPlayer({bool? useVLC, List<String> vlcCommandlineArgs = const <String>['--no-video'], int vlcPlayerId = 0}) {
    _isWindowsOrLinux = useVLC ?? !kIsWeb && (Platform.isWindows || Platform.isLinux);
    if (_isWindowsOrLinux) {
      DartVLC.initialize();
      _vlcPlayer = Player(id: vlcPlayerId, commandlineArguments: vlcCommandlineArgs);
      _vlcPlayer?.playbackStream.listen((PlaybackState playback) => _onPlayStateChange(!playback.isCompleted));
    } else {
      _vlcPlayer = null;
      _justAudioPlayer.processingStateStream.listen(
        (ProcessingState state) =>
            _onPlayStateChange(state == ProcessingState.completed || state == ProcessingState.idle),
      );
    }
  }

  Future<void> playSound(String asset, double volume, {bool cacheOnly = false}) async {
    if (_isPlaybackCompleted) {
      await _setAssetVolume(asset, volume);
      cacheOnly ? _onPlayStateChange(true) : await _play();
    }
  }

  void _onPlayStateChange(bool isPlaybackCompleted) {
    if (_isPlaybackCompleted != isPlaybackCompleted) {
      _isPlaybackCompleted = isPlaybackCompleted;
    }
  }

  Future<void> _play() async {
    if (_isWindowsOrLinux) {
      _vlcPlayer?.play();
    } else {
      await _justAudioPlayer.play();
      await _justAudioPlayer.pause();
    }
  }

  Future<void> _setAssetVolume(String asset, double volume) async {
    if (_isWindowsOrLinux) {
      _vlcPlayer?.setVolume(volume);
      _vlcPlayer?.open(Media.asset(asset), autoStart: false);
    } else {
      await _justAudioPlayer.setVolume(volume);
      await _justAudioPlayer.setAsset(asset);
    }
  }
}
