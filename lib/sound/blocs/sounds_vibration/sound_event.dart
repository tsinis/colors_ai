part of 'sound_bloc.dart';

abstract class SoundEvent extends Equatable {
  @override
  List<Object> get props => <Object>[];

  const SoundEvent();
}

class SoundStarted extends SoundEvent {
  const SoundStarted();
}

class SoundLocked extends SoundEvent {
  const SoundLocked();
}

class SoundRefreshed extends SoundEvent {
  const SoundRefreshed();
}

class SoundCopied extends SoundEvent {
  const SoundCopied();
}

class SoundFavoritesAdded extends SoundEvent {
  const SoundFavoritesAdded();
}
