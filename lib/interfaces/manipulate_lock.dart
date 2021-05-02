const bool locked = true, unlocked = false;

abstract class LockInterface {
  const LockInterface();

  void lock(int colorIndex);
  void unlockAll();
}
