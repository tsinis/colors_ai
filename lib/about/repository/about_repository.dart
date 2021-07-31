import 'package:package_info_plus/package_info_plus.dart';

import '../../core/services/url_launcher.dart';

class AboutRepository {
  static const UrlLauncher _urlLauncher = UrlLauncher();
  static const String _aboutGoogle = 'https://about.google/intl/',
      _aboutColormind = 'http://colormind.io/api-access',
      _sourceCode = 'https://github.com/tsinis/colors_ai',
      _soundsLicense = 'https://creativecommons.org/licenses/by/4.0/legalcode.',
      _materialSounds = 'https://material.io/design/sound/sound-resources.html';

  late final String locale;

  Future<void> init(String? currentLocale) async {
    await PackageInfo.fromPlatform().then((info) => _version = info.version);
    locale = currentLocale ?? 'en';
  }

  void openSourceCode() => _urlLauncher.openURL(_sourceCode);
  void openAboutApi() => _urlLauncher.openURL(_aboutColormind);
  void openAboutSounds() => _urlLauncher.openURL(_materialSounds);
  void openAboutGoogle() => _urlLauncher.openURL(_aboutGoogle + locale);
  void openAboutLicenses() => _urlLauncher.openURL(_soundsLicense + locale);

  late final String _version;

  String get version => _version;
}
