import 'package:package_info/package_info.dart';
import '../mixins/about_urls_launcher.dart';

class AboutRepository with AboutUrlsLauncher {
  AboutRepository() {
    PackageInfo.fromPlatform().then((info) => _version = info.version);
  }

  late final String _version, _locale;

  void init(String? currentLocale) => _locale = currentLocale ?? 'en';

  String get version => _version;
  String get locale => _locale;
}
