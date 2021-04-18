part of 'locked_bloc.dart';

abstract class LockState extends Equatable {
  const LockState();

  @override
  List<Object> get props => [];
}

class LockSuccess extends LockState {
  const LockSuccess({this.lockedColors = defaultColorLocks});
  final List<bool> lockedColors;
  bool isLocked(int index) => lockedColors[index];

  @override
  List<Object> get props => [isLocked];
}

class LockFailure extends LockState {
  const LockFailure();
}
