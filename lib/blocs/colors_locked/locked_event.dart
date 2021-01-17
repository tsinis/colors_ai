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
  const ChangeLockEvent(this.index);
  final int index;
}
