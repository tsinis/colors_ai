abstract class LockEvent {}

class UnLockEvent extends LockEvent {}

class ChangeLockEvent extends LockEvent {
  ChangeLockEvent(this.index);
  final int index;
}
