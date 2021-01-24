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

class SoundCopied extends SoundEvent {
  const SoundCopied();
}

class SoundSaved extends SoundEvent {
  const SoundSaved();
}

class SoundLeftSwiped extends SoundEvent {
  const SoundLeftSwiped();
}

class SoundRightSwiped extends SoundEvent {
  const SoundRightSwiped();
}
