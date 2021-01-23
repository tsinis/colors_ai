// ignore: import_of_legacy_library_into_null_safe
import 'package:just_audio/just_audio.dart';
import 'constants.dart';

class SoundsSource {
  const SoundsSource();

  static const String _uri = 'asset:///', _path = 'assets/sounds/', _format = '.ogg';

  ConcatenatingAudioSource get source => ConcatenatingAudioSource(children: _audioSourceList);

  String assetPath(String assetName) => _path + assetName + _format;

  List<AudioSource> get _audioSourceList {
    final List<AudioSource> audioSources = [];
    for (final String soundName in soundsList) {
      audioSources.add(AudioSource.uri(Uri.parse(_uri + _path + soundName + _format)));
    }
    return audioSources;
  }
}
