part of 'lock_bloc.dart';

abstract class LockEvent extends Equatable {
  @override
  List<Object> get props => [];

  const LockEvent();
}

class LockStarted extends LockEvent {
  const LockStarted();
}

class LockAllUnlocked extends LockEvent {
  const LockAllUnlocked();
}

class LockChanged extends LockEvent {
  final int index;
  final bool onlyLock;

  const LockChanged(this.index, {this.onlyLock = false});
}
