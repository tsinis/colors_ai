// ignore_for_file: prefer-moving-to-variable, not necessary, it's a test.
import 'package:bloc_test/bloc_test.dart';
import 'package:colors_ai/sound/blocs/sound_bloc.dart';
import 'package:colors_ai/sound/models/sound.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../data.dart';

void main() => group(
      '$SoundBloc',
      () {
        final Map<SoundEvent, String> events = <SoundEvent, String>{
          const SoundEvent.started(): Sound.notificationSimple.asset,
          const SoundEvent.refreshed(): Sound.refresh.asset,
          const SoundEvent.favoritesAdded(): Sound.notificationSimple.asset,
          const SoundEvent.locked(): Sound.lock.asset,
          const SoundEvent.copied(): Sound.notificationHigh.asset,
        };

        setUp(() => reset(mockedPlayer));
        blocTest<SoundBloc, void>('on Initial', build: () => SoundBloc(soundsRepository), expect: () => isEmpty);

        events.forEach(
          (SoundEvent event, String soundName) {
            blocTest<SoundBloc, void>(
              '${event.runtimeType}',
              build: () => SoundBloc(soundsRepository),
              act: (SoundBloc bloc) => bloc.add(event),
              verify: (_) async => verify(mockedPlayer.playSound(soundName, any)).called(1),
            );
          },
        );
      },
    );
