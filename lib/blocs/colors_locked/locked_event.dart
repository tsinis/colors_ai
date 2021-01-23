import 'package:equatable/equatable.dart';

abstract class LockEvent extends Equatable {
  const LockEvent();

  @override
  List<Object> get props => [];
}

class LockShowed extends LockEvent {
  const LockShowed();
}

class LockAllUnlocked extends LockEvent {
  // const LockAllUnlocked();
}

class LockChanged extends LockEvent {
  const LockChanged(this.index, {this.onlyLock = false});
  final int index;
  final bool onlyLock;
}
