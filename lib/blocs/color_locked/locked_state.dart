abstract class LockedState {
  final Set<int> _lockedColors;
  const LockedState(this._lockedColors);

  bool isLocked(int index) => _lockedColors.contains(index);
}

class LockState extends LockedState {
  const LockState(Set<int> lockedColors) : super(lockedColors);
}

class LockedErrorState extends LockedState {
  const LockedErrorState() : super(const {});
}
