// ignore_for_file: avoid-dynamic, because [Storage] read returns dynamic.
import 'package:bloc_test/bloc_test.dart';
import 'package:colors_ai/vibration/blocs/vibration_bloc.dart';
import 'package:colors_ai/vibration/services/vibrations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../data/fakes/fake_storage.dart';
import '../../data/mocks/vibrations_mock.dart';

Future<void> main() async {
  const String key = 'key';
  late Vibrations vibrations;
  late VibrationsMock vibrator;
  late FakeStorage<bool> storage;

  setUpAll(TestWidgetsFlutterBinding.ensureInitialized);

  setUp(() async {
    HydratedBloc.storage = storage = FakeStorage<bool>();
    vibrator = VibrationsMock(hasCustomVibrationsSupport: true);
    vibrations = await Vibrations.init();
  });

  group('$VibrationBloc', () {
    blocTest<VibrationBloc, VibrationState>(
      'on Initial',
      build: () => VibrationBloc(vibrations, vibrationsKey: key),
      expect: () => isEmpty,
      verify: (_) {
        expect(storage.writeCount, isZero);
        expect(storage.readCount, 1);
      },
    );

    blocTest<VibrationBloc, VibrationState>(
      'fromJson()',
      build: () => VibrationBloc(vibrations, vibrationsKey: key),
      expect: () => isEmpty,
      verify: (VibrationBloc bloc) async {
        expect(storage.readCount, 1);
        await storage.write(key, false);
        final VibrationState? state = bloc.fromJson(storage.map);
        expect(state, const VibrationState.initial(canVibrate: true, isVibrationEnabled: false));
      },
    );

    blocTest<VibrationBloc, VibrationState>(
      '$VibrationEvent.started',
      build: () => VibrationBloc(vibrations, vibrationsKey: key),
      act: (VibrationBloc bloc) => bloc.add(const VibrationEvent.started()),
      expect: () => <VibrationState>[const VibrationState.initial(canVibrate: true, isVibrationEnabled: true)],
      verify: (_) {
        expect(storage.writeCount, isZero);
        expect(storage.readCount, 1);
      },
    );

    blocTest<VibrationBloc, VibrationState>(
      '$VibrationEvent.vibrated',
      build: () => VibrationBloc(vibrations, vibrationsKey: key),
      act: (VibrationBloc bloc) {
        expect(vibrator.timesVibrated, isZero);
        bloc.add(const VibrationEvent.vibrated());
      },
      expect: () => <VibrationState>[const VibrationState.initial(canVibrate: true, isVibrationEnabled: true)],
      verify: (_) {
        expect(storage.writeCount, isZero);
        expect(storage.readCount, 1);
        expect(vibrator.timesVibrated, 1);
      },
    );

    group('$VibrationEvent.settingsChanged', () {
      blocTest<VibrationBloc, VibrationState>(
        'settingsChanged(isEnabled: false)',
        build: () => VibrationBloc(vibrations, vibrationsKey: key),
        act: (VibrationBloc bloc) => bloc.add(const VibrationEvent.settingsChanged(isEnabled: false)),
        expect: () => <VibrationState>[const VibrationState.initial(canVibrate: true, isVibrationEnabled: false)],
        verify: (_) {
          expect(storage.writeCount, 0);
          expect(storage.readCount, 1);
        },
      );

      blocTest<VibrationBloc, VibrationState>(
        'vibrate() after settingsChanged(isEnabled: false)',
        build: () => VibrationBloc(vibrations, vibrationsKey: key),
        act: (VibrationBloc bloc) => bloc
          ..add(const VibrationEvent.settingsChanged(isEnabled: false))
          ..add(const VibrationEvent.vibrated()),
        expect: () => <VibrationState>[const VibrationState.initial(canVibrate: true, isVibrationEnabled: false)],
        verify: (_) {
          expect(vibrator.timesVibrated, isZero);
          expect(storage.writeCount, 0);
          expect(storage.readCount, 1);
        },
      );

      blocTest<VibrationBloc, VibrationState>(
        'vibrate() after settingsChanged(isEnabled: true)',
        build: () => VibrationBloc(vibrations, vibrationsKey: key),
        act: (VibrationBloc bloc) => bloc
          ..add(const VibrationEvent.settingsChanged(isEnabled: true))
          ..add(const VibrationEvent.vibrated()),
        expect: () => <VibrationState>[const VibrationState.initial(canVibrate: true, isVibrationEnabled: true)],
        verify: (_) {
          expect(vibrator.timesVibrated, 1);
          expect(storage.writeCount, 0);
          expect(storage.readCount, 1);
        },
      );
    });
  });
}
