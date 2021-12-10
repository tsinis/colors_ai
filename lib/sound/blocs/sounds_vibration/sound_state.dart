part of 'sound_bloc.dart';

abstract class SoundState extends Equatable {
  @override
  List<Object> get props => <Object>[];

  const SoundState();
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
