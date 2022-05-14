import 'package:audioplayers/audioplayers.dart';

class SoundsPlayer {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> playSound(String? asset, double? volume, {bool cacheOnly = false}) async {
    if (asset != null) {
      if (cacheOnly && volume != null) {
        final double normalizedVolume = volume.clamp(0, 1);
        await _audioPlayer.setVolume(normalizedVolume);
      } else if (!cacheOnly) {
        await _audioPlayer.play(DeviceFileSource(asset), volume: volume);
      }
    }
  }
}
