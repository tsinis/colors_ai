abstract class LockInterface {
  const LockInterface();

  void lock(int colorIndex);
  void unlockAll();
}
