part of 'sound_bloc.dart';

abstract class SoundState extends Equatable {
  const SoundState();

  @override
  List<Object> get props => [];
}

class SoundInitial extends SoundState {
  const SoundInitial();
}

class SoundLoadSuccess extends SoundState {
  const SoundLoadSuccess();
}

class SoundLoadFailure extends SoundState {
  const SoundLoadFailure();
}
