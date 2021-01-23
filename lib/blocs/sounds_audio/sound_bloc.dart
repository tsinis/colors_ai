import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/sounds_repository.dart';

part 'sound_event.dart';
part 'sound_state.dart';

class SoundBloc extends Bloc<SoundEvent, SoundState> {
  SoundBloc() : super(const SoundInitial());

  static const SoundsAssets _savedRepository = SoundsAssets();

  @override
  Stream<SoundState> mapEventToState(SoundEvent event) async* {
    if (event is SoundStarted) {
      await _savedRepository.initial;
      try {
        yield const SoundLoadSuccess();
        // ignore: avoid_catches_without_on_clauses
      } catch (_) {
        yield const SoundLoadFailure();
      }
    }
    if (event is SoundLocked) {
      _savedRepository.playLock;
    }
    if (event is SoundRefreshed) {
      _savedRepository.playRefresh;
    }
  }
}
