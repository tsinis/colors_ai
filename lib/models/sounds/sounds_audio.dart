class SoundsSource {
  const SoundsSource();

  static const String _path = 'assets/sounds/', _format = '.ogg';

  String assetPath(String assetName) => _path + assetName + _format;

  // static const String _uri = 'asset:///';

  // ConcatenatingAudioSource get source => ConcatenatingAudioSource(children: _audioSourceList);

  // List<AudioSource> get _audioSourceList {
  //   final List<AudioSource> audioSources = [];
  //   for (final String soundName in soundsList) {
  //     audioSources.add(AudioSource.uri(Uri.parse(_uri + _path + soundName + _format)));
  //   }
  //   return audioSources;
  // }
}
