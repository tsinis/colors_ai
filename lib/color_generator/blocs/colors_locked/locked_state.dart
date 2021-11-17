part of 'locked_bloc.dart';

abstract class LockState extends Equatable {
  const LockState();

  @override
  List<Object> get props => [];
}

class LockSuccess extends LockState {
  const LockSuccess({this.lockedColors});

  final List<bool>? lockedColors;

  @override
  List<Object> get props => [isLocked];

  bool isLocked(int index) => lockedColors?[index] ?? false;
}

class LockFailure extends LockState {
  const LockFailure();
}
