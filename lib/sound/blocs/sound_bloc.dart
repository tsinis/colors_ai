import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../repository/sounds_repository.dart';
import 'sound_event.dart';

export 'sound_event.dart';

class SoundBloc extends Bloc<SoundEvent, void> {
  final SoundsRepository _soundRepository;

  SoundBloc(this._soundRepository) : super(null);

  @override
  Stream<void> mapEventToState(SoundEvent event) async* {
    event.when(
      copied: _soundRepository.playCopy,
      locked: _soundRepository.playLock,
      refreshed: _soundRepository.playRefresh,
      favoritesAdded: _soundRepository.playFavoritesAdded,
      started: () async {
        await _soundRepository.init();

        /// On web it's not allowed to play sounds without user interaction first.
        if (!kIsWeb) {
          _soundRepository.playFavoritesAdded();
        }
      },
    );
  }
}
