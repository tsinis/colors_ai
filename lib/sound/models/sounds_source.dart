import 'sound.dart';

class SoundsSource {
  final String directory;
  final String format;
  final String lock;
  final String notificationHigh;
  final String notificationSimple;
  final String refresh;

  const SoundsSource({
    this.directory = 'sounds/',
    this.format = '.mp3',
    this.lock = 'ui_lock',
    this.refresh = 'ui_refresh-feed',
    this.notificationSimple = 'notification_simple-02',
    this.notificationHigh = 'notification_high-intensity',
  });

  String asset(Sound sound) => _assetPath(_assetName(sound));

  String _assetName(Sound sound) {
    switch (sound) {
      case Sound.lock:
        return lock;
      case Sound.refresh:
        return refresh;
      case Sound.notificationSimple:
        return notificationSimple;
      case Sound.notificationHigh:
        return notificationHigh;
    }
  }

  String _assetPath(String assetName) => directory + assetName + format;
}
