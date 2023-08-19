// ignore_for_file: missing-test-assertion
import 'package:audioplayers/audioplayers.dart';
import 'package:colors_ai/sound/services/sounds_player.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../data/helpers/utils.dart';
import '../../data/mocks/generated.mocks.dart';

void main() => group('$SoundsPlayer', () {
      const double volume = 0.5;
      const String asset = 'sounds/ui_lock.mp3';
      final MockAudioPlayer player = MockAudioPlayer();
      late SoundsPlayer sounds;

      setUp(() async {
        reset(player);
        when<AudioCache>(player.audioCache).thenAnswer((_) => AudioCache());
        sounds = SoundsPlayer(player);
      });

      test('playSound() with null volume and with cache', () async {
        await sounds.playSound(asset, null, cachedFileNames: <String>[]);
        verifyNever(player.setVolume(volume));
      });

      test('playSound() with non-null volume and with cache', () async {
        await sounds.playSound(asset, volume, cachedFileNames: <String>[]);
        verify(player.setVolume(volume)).called(1);
      });

      test('playSound() with null volume and without cache', () async {
        await sounds.playSound(asset, null);
        verify(player.play(any)).called(1);
      });

      test('playSound() with non-null volume and without cache', () async {
        await sounds.playSound(asset, volume);
        verify(player.play(any, volume: volume)).called(1);
      });

      tearDownAll(deleteFakeStorageDir);
    });
