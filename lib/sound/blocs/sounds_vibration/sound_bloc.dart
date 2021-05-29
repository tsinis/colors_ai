import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repository/sounds_repository.dart';

part 'sound_event.dart';
part 'sound_state.dart';

class SoundBloc extends Bloc<SoundEvent, SoundState> {
  SoundBloc() : super(const SoundInitial());

  final SoundsRepository _soundRepository = SoundsRepository();

  @override
  Stream<SoundState> mapEventToState(SoundEvent event) async* {
    if (event is SoundStarted) {
      // ignore: unawaited_futures
      _soundRepository.init();
      // ignore: cascade_invocations
      _soundRepository.playFavoritesAdded();
    } else if (event is SoundRefreshed) {
      _soundRepository.playRefresh();
    } else if (event is SoundFavoritesAdded) {
      _soundRepository
        ..playFavoritesAdded()
        ..vibrate();
    } else if (event is SoundLocked) {
      _soundRepository.playLock();
    } else if (event is SoundCopied) {
      _soundRepository.playCopy();
    }
  }
}
