import 'dart:ui' show VoidCallback;

import 'package:colors_ai/sound/models/sound.dart';
import 'package:colors_ai/sound/repository/sounds_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../data.dart';

void main() => group('$SoundsRepository', () {
      setUp(() => reset(mockedPlayer));

      final Map<String, VoidCallback> methods = <String, VoidCallback>{
        Sound.notificationHigh.asset: soundsRepository.playCopy,
        Sound.notificationSimple.asset: soundsRepository.playFavoritesAdded,
        Sound.lock.asset: soundsRepository.playLock,
        Sound.refresh.asset: soundsRepository.playRefresh,
      };

      test('init()', () async {
        verifyZeroInteractions(mockedPlayer);
        await soundsRepository.init();
        verify(
          mockedPlayer.playSound(
            Sound.notificationSimple.asset,
            0.1,
            cachedFileNames: <String>[
              Sound.lock.asset,
              Sound.refresh.asset,
              Sound.notificationSimple.asset,
              Sound.notificationHigh.asset,
            ],
          ),
        ).called(1);
        verifyNoMoreInteractions(mockedPlayer);
      });

      test('play sound and handle player exception', () async {
        verifyZeroInteractions(mockedPlayer);
        when<void>(mockedPlayer.playSound(Sound.notificationHigh.asset, any)).thenThrow(Exception());
        await soundsRepository.playCopy();
        verify(mockedPlayer.playSound(Sound.notificationHigh.asset, any)).called(1);
        verifyNoMoreInteractions(mockedPlayer);
      });

      methods.forEach(
        (String soundName, VoidCallback playSoundMethod) => test('$soundName()', () async {
          verifyZeroInteractions(mockedPlayer);
          playSoundMethod();
          verify(mockedPlayer.playSound(soundName, any)).called(1);
          verifyNoMoreInteractions(mockedPlayer);
        }),
      );
    });
