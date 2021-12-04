part of 'lock_bloc.dart';

abstract class LockState extends Equatable {
  @override
  List<Object> get props => [];

  const LockState();
}

class LockSuccess extends LockState {
  final List<bool>? lockedColors;

  @override
  List<Object> get props => [isLocked];

  const LockSuccess({this.lockedColors});

  bool isLocked(int index) => lockedColors?[index] ?? false;
}

class LockFailure extends LockState {
  const LockFailure();
}
