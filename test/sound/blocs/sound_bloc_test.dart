import 'package:bloc_test/bloc_test.dart';
import 'package:colors_ai/sound/blocs/sound_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../data.dart';

void main() => group('$SoundBloc', () {
      final Map<SoundEvent, String> events = <SoundEvent, String>{
        const SoundStarted(): notificationSimpleFileName,
        const SoundRefreshed(): refreshSoundFileName,
        const SoundFavoritesAdded(): notificationSimpleFileName,
        const SoundLocked(): lockSoundFileName,
        const SoundCopied(): notificationHighFileName,
      };

      setUp(() => reset(mockedPlayer));
      blocTest<SoundBloc, void>('on Initial', build: () => SoundBloc(soundsRepository), expect: () => isEmpty);

      events.forEach((SoundEvent event, String soundName) {
        blocTest<SoundBloc, void>(
          '${event.runtimeType}',
          build: () => SoundBloc(soundsRepository),
          act: (SoundBloc bloc) => bloc.add(event),
          verify: (_) => verify(mockedPlayer.playSound(asset(soundName), any)).called(1),
        );
      });
    });
