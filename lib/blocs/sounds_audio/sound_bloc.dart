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
      _savedRepository.playSaved;
    } else if (event is SoundRefreshed) {
      _savedRepository.playRefresh;
    } else if (event is SoundSaved) {
      _savedRepository.playSaved;
    } else if (event is SoundLocked) {
      _savedRepository.playLock;
    } else if (event is SoundCopied) {
      _savedRepository.playCopy;
    }
    //  else if (event is SoundLeftSwiped) {
    //   _savedRepository.playSwipeLeft;
    // } else if (event is SoundRightSwiped) {
    //   _savedRepository.playSwipeRight;
    // }
  }
}
