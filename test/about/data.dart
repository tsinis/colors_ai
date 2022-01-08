import 'package:colors_ai/about/repository/about_repository.dart';
import 'package:colors_ai/core/services/url_launcher.dart';

import '../data/mocks/generated.mocks.dart';

const String colormind = 'Colormind';
const String defaultLangCode = '';
const String google = 'Google';
const String huemint = 'Huemint';
const String licenses = 'Licenses';
const String mockVersion = '1.0';
const String sounds = 'Sounds';
const String sourceCode = 'SourceCode';
const String supportedUrlLocale = ' with supported URL locale';
const String undefinedUrlLocale = ' with undefined URL locale';

final UrlLauncher mockedUrlLauncher = MockUrlLauncher();

final AboutRepository aboutRepository = AboutRepository(
  unsupportedUrlLocales: <String>[undefinedUrlLocale],
  defaultLanguageCode: defaultLangCode,
  urlLauncher: mockedUrlLauncher,
  aboutColormind: colormind,
  soundsLicense: licenses,
  sourceCode: sourceCode,
  materialSounds: sounds,
  aboutHuemint: huemint,
  aboutGoogle: google,
);
