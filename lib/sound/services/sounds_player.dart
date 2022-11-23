import 'package:audioplayers/audioplayers.dart';

class SoundsPlayer {
  final AudioPlayer _audioPlayer = AudioPlayer();

  // ignore: unnecessary-nullable, it's easier to test nullable arguments (for stubs).
  Future<void> playSound(String asset, double? volume, {List<String>? cachedFileNames}) async {
    final bool cacheOnly = cachedFileNames != null;
    if (cacheOnly && volume != null) {
      final double normalizedVolume = volume.clamp(0, 1);
      await _audioPlayer.audioCache.loadAll(cachedFileNames);
      await _audioPlayer.setVolume(normalizedVolume);
    } else if (!cacheOnly) {
      final AssetSource sound = AssetSource(asset);
      // TODO: Turn on  mode: PlayerMode.lowLatency after fix.
      await _audioPlayer.play(sound, volume: volume);
    }
  }
}
