import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/sounds_repository.dart';

part 'sound_event.dart';
part 'sound_state.dart';

class SoundBloc extends Bloc<SoundEvent, SoundState> {
  SoundBloc() : super(const SoundInitial());

  static const SoundsAssets _soundRepository = SoundsAssets();

  @override
  Stream<SoundState> mapEventToState(SoundEvent event) async* {
    if (event is SoundStarted) {
      _soundRepository.playFavoritesAdded();
    } else if (event is SoundRefreshed) {
      _soundRepository.playRefresh();
    } else if (event is SoundFavoritesAdded) {
      _soundRepository.playFavoritesAdded();
    } else if (event is SoundLocked) {
      _soundRepository.playLock();
    } else if (event is SoundCopied) {
      _soundRepository.playCopy();
    }
  }
}
