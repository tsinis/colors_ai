import 'package:audioplayers/audioplayers.dart';

class SoundsPlayer {
  late final AudioPlayer _audioPlayer;

  SoundsPlayer({AudioPlayer? audioPlayer}) {
    // TODO: Add [AudioCache]
    _audioPlayer = audioPlayer ?? AudioPlayer();
  }

  Future<void> playSound(String? asset, double? volume, {bool cacheOnly = false}) async {
    if (asset != null && volume != null) {
      final double normalizedVolume = volume.clamp(0, 1);
      await _audioPlayer.setVolume(normalizedVolume);
      await _audioPlayer.play(DeviceFileSource(asset));
    }
  }
}
