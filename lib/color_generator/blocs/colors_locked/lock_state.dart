part of 'lock_bloc.dart';

abstract class LockState extends Equatable {
  const LockState();
}

class LockSuccess extends LockState {
  final List<bool>? lockedColors;

  @override
  List<Object> get props => <Object>[isLocked];

  const LockSuccess({this.lockedColors});

  bool isLocked(int index) {
    try {
      return lockedColors?.elementAt(index) ?? false;
      // ignore: avoid_catches_without_on_clauses
    } catch (_) {
      return false;
    }
  }
}
