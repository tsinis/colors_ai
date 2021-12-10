import 'package:flutter/foundation.dart' show LicenseRegistry, LicenseEntryWithLineBreaks;
import 'package:flutter/services.dart' show rootBundle;
import 'package:package_info_plus/package_info_plus.dart';

import '../../core/services/url_launcher.dart';

class AboutRepository {
  final String _aboutColormind;
  final String _aboutGoogle;
  late final String _locale;
  final String _materialSounds;
  final String _soundsLicense;
  final String _sourceCode;
  final UrlLauncher _urlLauncher;
  late final String _version;

  String get version => _version;

  AboutRepository({
    String aboutColormind = 'http://colormind.io/api-access',
    String aboutGoogle = 'https://about.google/intl/',
    String materialSounds = 'https://material.io/design/sound/sound-resources.html',
    String soundsLicense = 'https://creativecommons.org/licenses/by/4.0/legalcode.',
    String sourceCode = 'https://github.com/tsinis/colors_ai',
    UrlLauncher urlLauncher = const UrlLauncher(),
  })  : _urlLauncher = urlLauncher,
        _aboutColormind = aboutColormind,
        _aboutGoogle = aboutGoogle,
        _materialSounds = materialSounds,
        _soundsLicense = soundsLicense,
        _sourceCode = sourceCode;

  Future<void> init(String? currentLocale) async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    _version = info.version;
    _locale = currentLocale ?? 'en';
    LicenseRegistry.addLicense(() async* {
      final license = await rootBundle.loadString('assets/google_fonts/LICENSE.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    });
  }

  void openSourceCode() => _urlLauncher.openURL(_sourceCode);

  void openAboutApi() => _urlLauncher.openURL(_aboutColormind);

  void openAboutSounds() => _urlLauncher.openURL(_materialSounds);

  void openAboutGoogle() => _urlLauncher.openURL(_aboutGoogle + _locale);

  void openAboutLicenses() => _urlLauncher.openURL(_soundsLicense + (_locale != 'sk' ? _locale : 'en'));
}
