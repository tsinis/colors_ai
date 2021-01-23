part of 'sound_bloc.dart';

abstract class SoundEvent extends Equatable {
  const SoundEvent();

  @override
  List<Object> get props => [];
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
