import '../../services/api/constants.dart';

abstract class LockedState {
  const LockedState();
}

class LockState extends LockedState {
  const LockState({this.lockedColors = defaultColorLocks});
  final List<bool> lockedColors;
  bool isLocked(int index) => lockedColors[index];
}

class LockedErrorState extends LockedState {
  const LockedErrorState();
}
