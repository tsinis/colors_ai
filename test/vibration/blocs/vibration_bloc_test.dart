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
  late VibrationsMock channel;
  late FakeStorage<bool> storage;

  setUpAll(TestWidgetsFlutterBinding.ensureInitialized);

  setUp(() async {
    HydratedBloc.storage = storage = FakeStorage<bool>();
    channel = VibrationsMock(hasCustomVibrationsSupport: true);
    VibrationsMock.channel.setMockMethodCallHandler(channel.handleMethodCall);
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
        expect(channel.calls(), isZero);
        bloc.add(const VibrationEvent.vibrated());
      },
      expect: () => <VibrationState>[const VibrationState.initial(canVibrate: true, isVibrationEnabled: true)],
      verify: (_) {
        expect(storage.writeCount, isZero);
        expect(storage.readCount, 1);
        expect(channel.calls(), 1);
      },
    );
  });
}
