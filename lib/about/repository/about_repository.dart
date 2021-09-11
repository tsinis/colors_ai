import 'package:flutter/foundation.dart' show LicenseRegistry, LicenseEntryWithLineBreaks;
import 'package:flutter/services.dart' show rootBundle;
import 'package:package_info_plus/package_info_plus.dart';

import '../../core/services/url_launcher.dart';

class AboutRepository {
  late final String locale;
  static const UrlLauncher _urlLauncher = UrlLauncher();
  static const String _aboutGoogle = 'https://about.google/intl/';
  static const String _aboutColormind = 'http://colormind.io/api-access';
  static const String _sourceCode = 'https://github.com/tsinis/colors_ai';
  static const String _soundsLicense = 'https://creativecommons.org/licenses/by/4.0/legalcode.';
  static const String _materialSounds = 'https://material.io/design/sound/sound-resources.html';

  Future<void> init(String? currentLocale) async {
    await PackageInfo.fromPlatform().then((PackageInfo info) => _version = info.version);
    locale = currentLocale ?? 'en';
    LicenseRegistry.addLicense(() async* {
      final license = await rootBundle.loadString('google_fonts/LICENSE.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    });
  }

  void openSourceCode() => _urlLauncher.openURL(_sourceCode);
  void openAboutApi() => _urlLauncher.openURL(_aboutColormind);
  void openAboutSounds() => _urlLauncher.openURL(_materialSounds);
  void openAboutGoogle() => _urlLauncher.openURL(_aboutGoogle + locale);
  void openAboutLicenses() => _urlLauncher.openURL(_soundsLicense + locale);

  late final String _version;

  String get version => _version;
}
