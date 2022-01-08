import 'package:bloc_test/bloc_test.dart';
import 'package:colors_ai/about/blocs/about_bloc.dart';
import 'package:colors_ai/core/ui/constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../data.dart';

Future<void> main() async {
  const Map<String, AboutEvent> events = <String, AboutEvent>{
    sourceCode: AboutSourceCodeTaped(),
    colormind: AboutColormindTaped(),
    licenses: AboutLicensesTaped(),
    huemint: AboutHuemintTaped(),
    sounds: AboutSoundsTaped(),
    google: AboutGoogleTaped(),
  };

  setUpAll(
    () => PackageInfo.setMockInitialValues(
      appName: kAppName,
      packageName: kAppName,
      version: mockVersion,
      buildNumber: mockVersion,
      buildSignature: mockVersion,
    ),
  );

  setUp(() => reset(mockedUrlLauncher));

  blocTest<AboutBloc, AboutState>(
    '$AboutBloc on Initial',
    build: () => AboutBloc(aboutRepository),
    expect: () => isEmpty,
    verify: (AboutBloc bloc) => expect(bloc.state.appVersion, isEmpty),
  );

  blocTest<AboutBloc, AboutState>(
    '$AboutBloc on $Exception',
    build: () => AboutBloc(aboutRepository),
    act: (AboutBloc bloc) {
      when<Future<bool>>(mockedUrlLauncher.openURL(any)).thenThrow('Link tap error');
      bloc
        ..add(const AboutStarted(currentLocale: supportedUrlLocale))
        ..add(const AboutColormindTaped());
    },
    skip: 1,
    expect: () => <TypeMatcher<AboutState>>[isA<AboutFailure>(), isA<AboutInitial>()],
  );

  blocTest<AboutBloc, AboutState>(
    '$AboutBloc $AboutStarted$supportedUrlLocale',
    build: () => AboutBloc(aboutRepository),
    act: (AboutBloc bloc) => bloc.add(const AboutStarted(currentLocale: supportedUrlLocale)),
    expect: () => <TypeMatcher<AboutState>>[isA<AboutInitial>()],
    verify: (AboutBloc bloc) {
      expect(aboutRepository.supportedUrlLocale, supportedUrlLocale);
      expect(bloc.state.appVersion, mockVersion);
    },
  );

  blocTest<AboutBloc, AboutState>(
    '$AboutBloc $AboutStarted$undefinedUrlLocale',
    build: () => AboutBloc(aboutRepository),
    act: (AboutBloc bloc) => bloc.add(const AboutStarted(currentLocale: undefinedUrlLocale)),
    expect: () => <TypeMatcher<AboutState>>[isA<AboutInitial>()],
    verify: (AboutBloc bloc) {
      expect(aboutRepository.supportedUrlLocale, defaultLangCode);
      expect(bloc.state.appVersion, mockVersion);
    },
  );

  await Future.forEach<MapEntry<String, AboutEvent>>(
    events.entries,
    (MapEntry<String, AboutEvent> e) async {
      final String url = e.key;
      final AboutEvent event = e.value;
      blocTest<AboutBloc, AboutState>(
        '$AboutBloc ${event.runtimeType}',
        build: () => AboutBloc(aboutRepository),
        act: (AboutBloc bloc) {
          when<Future<bool>>(mockedUrlLauncher.openURL(url)).thenAnswer((_) async => true);
          bloc
            ..add(const AboutStarted(currentLocale: defaultLangCode))
            ..add(event);
        },
        skip: 1,
        verify: (_) => verify(mockedUrlLauncher.openURL(url)).called(1),
      );
    },
  );
}
