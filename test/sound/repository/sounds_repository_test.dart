import 'dart:ui' show VoidCallback;

import 'package:colors_ai/sound/repository/sounds_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../data.dart';

void main() => group('$SoundsRepository', () {
      setUp(() => reset(mockedPlayer));

      final Map<String, VoidCallback> methods = <String, VoidCallback>{
        notificationHighFileName: soundsRepository.playCopy,
        notificationSimpleFileName: soundsRepository.playFavoritesAdded,
        lockSoundFileName: soundsRepository.playLock,
        refreshSoundFileName: soundsRepository.playRefresh,
      };

      test('init()', () async {
        verifyZeroInteractions(mockedPlayer);
        await soundsRepository.init();
        verify(
          mockedPlayer.playSound(asset(notificationSimpleFileName), 0.1, cacheOnly: true),
        ).called(1);
        verifyNoMoreInteractions(mockedPlayer);
      });

      methods.forEach(
        (String soundName, VoidCallback playSoundMethod) => test('$soundName()', () {
          verifyZeroInteractions(mockedPlayer);
          playSoundMethod();
          verify(mockedPlayer.playSound(asset(soundName), any)).called(1);
          verifyNoMoreInteractions(mockedPlayer);
        }),
      );
    });
