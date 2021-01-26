import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/sounds_repository.dart';

part 'sound_event.dart';
part 'sound_state.dart';

class SoundBloc extends Bloc<SoundEvent, SoundState> {
  SoundBloc() : super(const SoundInitial());

  static const SoundsAssets _favoritesRepository = SoundsAssets();

  @override
  Stream<SoundState> mapEventToState(SoundEvent event) async* {
    if (event is SoundStarted) {
      _favoritesRepository.playFavoritesAdded;
    } else if (event is SoundRefreshed) {
      _favoritesRepository.playRefresh;
    } else if (event is SoundFavoritesAdded) {
      _favoritesRepository.playFavoritesAdded;
    } else if (event is SoundLocked) {
      _favoritesRepository.playLock;
    } else if (event is SoundCopied) {
      _favoritesRepository.playCopy;
    }
    //  else if (event is SoundLeftSwiped) {
    //   _favoritesRepository.playSwipeLeft;
    // } else if (event is SoundRightSwiped) {
    //   _favoritesRepository.playSwipeRight;
    // }
  }
}
