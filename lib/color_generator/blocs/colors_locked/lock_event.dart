part of 'lock_bloc.dart';

abstract class LockEvent extends Equatable {
  const LockEvent();
}

class LockStarted extends LockEvent {
  @override
  List<Object> get props => <Object>[];

  const LockStarted();
}

class LockAllUnlocked extends LockEvent {
  @override
  List<Object> get props => <Object>[];

  const LockAllUnlocked();
}

class LockChanged extends LockEvent {
  final int index;
  final bool onlyLock;

  @override
  List<Object> get props => <Object>[index, onlyLock];

  const LockChanged(this.index, {this.onlyLock = false});
}
