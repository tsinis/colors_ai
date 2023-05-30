import 'package:audioplayers/audioplayers.dart';

class SoundsPlayer {
  final AudioPlayer _audioPlayer;

  SoundsPlayer([AudioPlayer? audioPlayer]) : _audioPlayer = audioPlayer ?? AudioPlayer();

  // ignore: unnecessary-nullable, it's easier to test nullable arguments (for stubs).
  Future<void> playSound(String asset, double? volume, {List<String>? cachedFileNames}) async {
    final bool cacheOnly = cachedFileNames != null;
    if (cacheOnly && volume != null) {
      final double normalizedVolume = volume.clamp(0, 1);
      await _audioPlayer.audioCache.loadAll(cachedFileNames);

      return _audioPlayer.setVolume(normalizedVolume);
    } else if (!cacheOnly) {
      // TODO: Turn on  mode: PlayerMode.lowLatency after fix.
      return _audioPlayer.play(AssetSource(asset), volume: volume);
    }
  }
}
