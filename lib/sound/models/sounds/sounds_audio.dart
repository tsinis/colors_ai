class SoundsSource {
  const SoundsSource();

  static const String _path = 'assets/sounds/', _format = '.ogg';

  String assetPath(String assetName) => _path + assetName + _format;
}
