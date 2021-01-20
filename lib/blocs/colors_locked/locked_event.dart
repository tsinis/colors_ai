abstract class LockEvent {
  const LockEvent();
}

class ShowLockEvent extends LockEvent {
  const ShowLockEvent();
}

class UnlockAllEvent extends LockEvent {
  // const UnlockAllEvent();
}

class ChangeLockEvent extends LockEvent {
  const ChangeLockEvent(this.index, {this.onlyLock = false});
  final int index;
  final bool onlyLock;
}
