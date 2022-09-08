import '../../resources/sounds.dart';

enum Sound {
  lock,
  refresh,
  notificationSimple,
  notificationHigh;

  const Sound();

  String get asset {
    late final String fullPath;
    switch (this) {
      case Sound.refresh:
        fullPath = Sounds.uiRefreshFeed;
        break;
      case Sound.notificationSimple:
        fullPath = Sounds.notificationSimple02;
        break;
      case Sound.notificationHigh:
        fullPath = Sounds.notificationHighIntensity;
        break;
      case Sound.lock:
        fullPath = Sounds.uiLock;
        break;
    }

    return fullPath.replaceFirst('assets/', '');
  }
}
