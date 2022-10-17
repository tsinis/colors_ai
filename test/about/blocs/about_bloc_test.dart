import 'package:bloc_test/bloc_test.dart';
import 'package:colors_ai/about/blocs/about_bloc.dart';
import 'package:colors_ai/core/ui/constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../data.dart';

Future<void> main() async {
  const Map<String, AboutEvent> events = <String, AboutEvent>{
    sourceCode: AboutEvent.sourceCodeTaped(),
    colormind: AboutEvent.colormindTaped(),
    licenses: AboutEvent.licensesTaped(),
    huemint: AboutEvent.huemintTaped(),
    sounds: AboutEvent.soundsTaped(),
    google: AboutEvent.googleTaped(),
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

  blocTest<AboutBloc, AboutState>(
    '$AboutBloc on Initial',
    build: () => AboutBloc(aboutRepository),
    expect: () => isEmpty,
    verify: (AboutBloc bloc) => expect(bloc.state, const AboutState.initial()),
  );

  blocTest<AboutBloc, AboutState>(
    '$AboutBloc on $Exception',
    build: () => AboutBloc(aboutRepository),
    act: (AboutBloc bloc) {
      when<Future<bool>>(mockedUrlLauncher.openURL(any)).thenThrow('Link tap error');
      bloc
        ..add(const AboutEvent.started(currentLocale: supportedUrlLocale))
        ..add(const AboutEvent.colormindTaped());
    },
    skip: 1,
    expect: () => <AboutState>[const AboutState.failure(), const AboutState.loaded(appVersion: '1.0')],
  );

  blocTest<AboutBloc, AboutState>(
    '$AboutBloc AboutState.started(currentLocale:$supportedUrlLocale)',
    build: () => AboutBloc(aboutRepository),
    act: (AboutBloc bloc) => bloc.add(const AboutEvent.started(currentLocale: supportedUrlLocale)),
    expect: () => <AboutState>[const AboutState.loaded(appVersion: '1.0')],
    verify: (AboutBloc bloc) {
      expect(aboutRepository.supportedUrlLocale, supportedUrlLocale);
      expect(bloc.state, const AboutState.loaded(appVersion: '1.0'));
    },
  );

  blocTest<AboutBloc, AboutState>(
    '$AboutBloc AboutState.started(currentLocale:$undefinedUrlLocale)',
    build: () => AboutBloc(aboutRepository),
    act: (AboutBloc bloc) => bloc.add(const AboutEvent.started(currentLocale: undefinedUrlLocale)),
    expect: () => <AboutState>[const AboutState.loaded(appVersion: '1.0')],
    verify: (AboutBloc bloc) {
      expect(aboutRepository.supportedUrlLocale, defaultLangCode);
      expect(bloc.state, const AboutState.loaded(appVersion: '1.0'));
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
            ..add(const AboutEvent.started(currentLocale: defaultLangCode))
            ..add(event);
        },
        skip: 1,
        verify: (_) => verify(mockedUrlLauncher.openURL(url)).called(1),
      );
    },
  );
}
