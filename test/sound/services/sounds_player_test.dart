import 'package:colors_ai/sound/services/sounds_player.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => group('$SoundsPlayer', () {
      const double volume = 0.5;
      const String asset = 'asset';
      const String setVolumeMethod = 'setVolume';
      const Set<String> expectedMethodNames = <String>{'setSourceUrl', 'resume'};

      const MethodChannel channel = MethodChannel('xyz.luan/audioplayers');
      final List<MethodCall> calls = <MethodCall>[];
      final SoundsPlayer player = SoundsPlayer();

      Set<String> methodNames() => calls.map((MethodCall call) => call.method).toSet();

      setUpAll(() {
        TestWidgetsFlutterBinding.ensureInitialized();
        channel.setMockMethodCallHandler((MethodCall call) async => calls.add(call));
      });

      setUpAll(calls.clear);

      test('playSound() with null asset', () async {
        await player.playSound(null, volume);
        expect(calls.isEmpty, true);
      });

      test('playSound() with null volume and cacheOnly: true', () async {
        await player.playSound(asset, null, cacheOnly: true);
        expect(calls.isEmpty, true);
      });

      test('playSound() with non-null volume and cacheOnly: true', () async {
        await player.playSound(asset, volume, cacheOnly: true);
        expect(calls.length, 1);
        expect(calls.first.method, setVolumeMethod);
      });

      test('playSound() with null volume and cacheOnly: false', () async {
        await player.playSound(asset, null);
        expect(methodNames(), <String>{setVolumeMethod, ...expectedMethodNames});
      });

      test('playSound() with non-null volume and cacheOnly: false', () async {
        await player.playSound(asset, volume);
        expect(methodNames(), <String>{setVolumeMethod, ...expectedMethodNames});
      });
    });
