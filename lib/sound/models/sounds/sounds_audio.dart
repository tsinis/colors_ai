class SoundsSource {
  const SoundsSource();

  static const String _path = 'assets/sounds/';
  static const String _format = '.wav';

  String assetPath(String assetName) => _path + assetName + _format;
}
