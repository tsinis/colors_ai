import 'package:audioplayers/audioplayers.dart';
import 'package:platform_info/platform_info.dart';

class SoundsPlayer {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> playSound(String? asset, double? volume, {List<String>? cachedFileNames}) async {
    if (asset != null) {
      final bool cacheOnly = cachedFileNames != null;
      if (cacheOnly && volume != null) {
        final double normalizedVolume = volume.clamp(0, 1);
        await _audioPlayer.audioCache.loadAll(cachedFileNames);
        await _audioPlayer.setVolume(normalizedVolume);
      } else if (!cacheOnly) {
        final AssetSource sound = AssetSource(asset);
        if (platform.isAndroid) {
          await _audioPlayer.play(sound, volume: volume, mode: PlayerMode.lowLatency);
        } else {
          await _audioPlayer.play(sound, volume: volume);
        }
      }
    }
  }
}
