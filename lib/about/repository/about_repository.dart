import 'package:flutter/foundation.dart' show LicenseEntryWithLineBreaks, LicenseRegistry, visibleForTesting;
import 'package:flutter/services.dart' show rootBundle;
import 'package:package_info_plus/package_info_plus.dart';

import '../../core/services/url_launcher.dart';
import '../../core/ui/constants.dart';

class AboutRepository {
  final String _aboutColormind;
  final String _aboutGoogle;
  final String _aboutHuemint;
  final String _defaultLanguageCode;
  late String _locale;
  final String _materialSounds;
  final String _soundsLicense;
  final String _sourceCode;
  final List<String> _unsupportedUrlLocales;
  final UrlLauncher _urlLauncher;
  late String _version;

  String get version => _version;

  @visibleForTesting
  String get supportedUrlLocale => _unsupportedUrlLocales.contains(_locale) ? _defaultLanguageCode : _locale;

  AboutRepository({
    String aboutColormind = 'http://colormind.io/api-access',
    String aboutGoogle = 'https://about.google/intl/',
    String aboutHuemint = 'https://huemint.com/about',
    String defaultLanguageCode = kDefaultLanguageCode,
    String materialSounds = 'https://material.io/design/sound/sound-resources.html',
    String soundsLicense = 'https://creativecommons.org/licenses/by/4.0/legalcode.',
    String sourceCode = 'https://github.com/tsinis/colors_ai',
    List<String> unsupportedUrlLocales = const <String>['sk'],
    UrlLauncher urlLauncher = const UrlLauncher(),
  })  : _urlLauncher = urlLauncher,
        _unsupportedUrlLocales = unsupportedUrlLocales,
        _aboutColormind = aboutColormind,
        _aboutGoogle = aboutGoogle,
        _aboutHuemint = aboutHuemint,
        _defaultLanguageCode = defaultLanguageCode,
        _materialSounds = materialSounds,
        _soundsLicense = soundsLicense,
        _sourceCode = sourceCode;

  Future<void> init(String? currentLocale) async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    _version = info.version;
    _locale = currentLocale ?? _defaultLanguageCode;
    LicenseRegistry.addLicense(() async* {
      final String license = await rootBundle.loadString('assets/google_fonts/LICENSE.txt');
      yield LicenseEntryWithLineBreaks(<String>['google_fonts'], license);
    });
  }

  Future<bool> openAboutColormind() => _urlLauncher.openURL(_aboutColormind);

  Future<bool> openAboutGoogle() => _urlLauncher.openURL(_aboutGoogle + _locale);

  Future<bool> openAboutHuemint() => _urlLauncher.openURL(_aboutHuemint);

  Future<bool> openAboutLicenses() => _urlLauncher.openURL(_soundsLicense + supportedUrlLocale);

  Future<bool> openAboutSounds() => _urlLauncher.openURL(_materialSounds);

  Future<bool> openSourceCode() => _urlLauncher.openURL(_sourceCode);
}
