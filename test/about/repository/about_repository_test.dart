import 'package:colors_ai/about/repository/about_repository.dart';
import 'package:colors_ai/core/ui/constants.dart';
import 'package:flutter/foundation.dart' show LicenseRegistry, LicenseEntryWithLineBreaks, LicenseEntry;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../data.dart';

Future<void> main() async {
  final Map<String, Future<bool> Function()> methods = <String, Future<bool> Function()>{
    sourceCode: aboutRepository.openSourceCode,
    colormind: aboutRepository.openAboutColormind,
    licenses: aboutRepository.openAboutLicenses,
    huemint: aboutRepository.openAboutHuemint,
    sounds: aboutRepository.openAboutSounds,
    google: aboutRepository.openAboutGoogle,
  };

  setUpAll(
    () => PackageInfo.setMockInitialValues(
      appName: kAppName,
      packageName: kAppName,
      version: mockVersion,
      buildNumber: mockVersion,
      buildSignature: mockVersion,
      installerStore: null,
    ),
  );

  setUp(() => reset(mockedUrlLauncher));

  test('$AboutRepository init()$supportedUrlLocale', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    verifyZeroInteractions(mockedUrlLauncher);
    await aboutRepository.init(supportedUrlLocale);

    final List<LicenseEntry> fontLicenses = await LicenseRegistry.licenses.toList();
    expect(fontLicenses.length, 1);
    expect(fontLicenses.first.runtimeType, LicenseEntryWithLineBreaks);

    expect(aboutRepository.supportedUrlLocale, supportedUrlLocale);
    when<Future<bool>>(mockedUrlLauncher.openURL(any)).thenAnswer((_) async => true);

    final bool canOpenUrl = await aboutRepository.openAboutLicenses();

    verifyNever(mockedUrlLauncher.openURL(licenses + defaultLangCode));
    verify(mockedUrlLauncher.openURL(licenses + supportedUrlLocale)).called(1);

    expect(canOpenUrl, isTrue);
    verifyNoMoreInteractions(mockedUrlLauncher);
  });

  test(
    '$AboutRepository init()$undefinedUrlLocale',
    () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      await aboutRepository.init(null);
      final List<LicenseEntry> fontLicenses = await LicenseRegistry.licenses.toList();
      expect(fontLicenses.length, 2);
      expect(fontLicenses.first.runtimeType, LicenseEntryWithLineBreaks);
      expect(aboutRepository.supportedUrlLocale, defaultLangCode);
      expect(aboutRepository.version, mockVersion);
    },
  );

  await Future.forEach<MapEntry<String, Future<bool> Function()>>(
    methods.entries,
    (MapEntry<String, Future<bool> Function()> m) async {
      final String url = m.key;
      test('$AboutRepository openAbout$url()', () async {
        verifyZeroInteractions(mockedUrlLauncher);
        when<Future<bool>>(mockedUrlLauncher.openURL(url + defaultLangCode)).thenAnswer((_) async => true);
        final bool canOpenUrl = await m.value();
        expect(canOpenUrl, isTrue);
        verify(mockedUrlLauncher.openURL(url + defaultLangCode)).called(1);
        verifyNoMoreInteractions(mockedUrlLauncher);
      });
    },
  );
}
