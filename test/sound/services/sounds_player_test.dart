import 'package:colors_ai/sound/services/sounds_player.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../../data/fakes/constants.dart';
import '../../data/fakes/fake_path_provider_platform.dart';
import '../../data/helpers/utils.dart';

void main() => group('$SoundsPlayer', () {
      const double volume = 0.5;
      const String asset = 'sounds/ui_lock.mp3';
      // String setPlayerMode = 'setPlayerMode';  TODO: Turn on after fix.
      const String setVolumeMethod = 'setVolume';
      const Set<String> expectedMethodNames = <String>{'setSourceUrl', 'resume'};

      const MethodChannel channel = MethodChannel('xyz.luan/audioplayers');
      final List<MethodCall> calls = <MethodCall>[];

      late SoundsPlayer player;

      Set<String> methodNames() => calls.map((MethodCall call) => call.method).toSet();

      setUpAll(() {
        TestWidgetsFlutterBinding.ensureInitialized();
        PathProviderPlatform.instance = FakePathProviderPlatform(temporaryPath: fakeStorageDir);
        channel.setMockMethodCallHandler((MethodCall call) async => calls.add(call));
        player = SoundsPlayer();
      });

      setUp(calls.clear);

      test('playSound() with null asset', () async {
        await player.playSound(null, volume);
        expect(calls.isEmpty, true);
      });

      test('playSound() with null volume and with cache', () async {
        await player.playSound(asset, null, cachedFileNames: <String>[]);
        expect(calls.isEmpty, true);
      });

      test('playSound() with non-null volume and with cache', () async {
        await player.playSound(asset, volume, cachedFileNames: <String>[]);
        expect(calls.length, 1);
        expect(calls.first.method, setVolumeMethod);
      });

      test('playSound() with null volume and without cache', () async {
        await player.playSound(asset, null);
        expect(methodNames(), <String>{...expectedMethodNames});
      });

      test('playSound() with non-null volume and without cache', () async {
        await player.playSound(asset, volume);
        expect(methodNames(), <String>{setVolumeMethod, ...expectedMethodNames});
      });

      tearDownAll(deleteFakeStorageDir);
    });
