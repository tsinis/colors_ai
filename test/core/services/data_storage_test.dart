import 'dart:io';

import 'package:colors_ai/core/services/data_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../../data/fakes/fake_path_provider_platform.dart';
import '../../data/mocks/generated.mocks.dart';

void main() => group(
      '$DataStorage',
      () {
        const String secureKey = 'secureKey';
        const String secureValue = 'MSoUjRYPsyGQC8axeAxeASIxMafiaDuR7cIqJLr-DHU=';
        final FakePathProviderPlatform fakePlatform = FakePathProviderPlatform();
        final MockFlutterSecureStorage mockedSecureStorage = MockFlutterSecureStorage();
        late DataStorage storage;

        setUpAll(() => PathProviderPlatform.instance = fakePlatform);

        setUp(() {
          reset(mockedSecureStorage);
          storage = DataStorage(keyStorage: mockedSecureStorage, secureKey: secureKey);
        });

        test('path', () async {
          final String path = await storage.path;
          expect(path.startsWith(fakePlatform.applicationDocumentsPath), true);
        });

        test('init() on first run', () async {
          verifyZeroInteractions(mockedSecureStorage);
          when<Future<bool>>(mockedSecureStorage.containsKey(key: secureKey)).thenAnswer((_) async => false);
          when<Future<String?>>(mockedSecureStorage.read(key: secureKey)).thenAnswer((_) async => secureValue);

          final HiveCipher? cipher = await storage.init();
          verify(mockedSecureStorage.containsKey(key: secureKey)).called(1);
          verify(mockedSecureStorage.read(key: secureKey)).called(1);
          verify(mockedSecureStorage.write(key: secureKey, value: anyNamed('value'))).called(1);

          expect(cipher, isNotNull);

          verifyNoMoreInteractions(mockedSecureStorage);
        });

        test('init() after first install', () async {
          verifyZeroInteractions(mockedSecureStorage);
          when<Future<bool>>(mockedSecureStorage.containsKey(key: secureKey)).thenAnswer((_) async => true);
          when<Future<String?>>(mockedSecureStorage.read(key: secureKey)).thenAnswer((_) async => secureValue);

          final HiveCipher? cipher = await storage.init();
          verify(mockedSecureStorage.containsKey(key: secureKey)).called(1);
          verify(mockedSecureStorage.read(key: secureKey)).called(2);

          expect(cipher, isNotNull);
          verifyNoMoreInteractions(mockedSecureStorage);
        });

        tearDownAll(() => Directory(fakePlatform.applicationDocumentsPath).deleteSync(recursive: true));
      },
      skip: Platform.isLinux,
    );
