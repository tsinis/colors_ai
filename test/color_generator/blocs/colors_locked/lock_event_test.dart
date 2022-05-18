import 'package:colors_ai/color_generator/blocs/colors_locked/lock_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('$LockStarted props', () {
    const LockStarted lockEvent = LockStarted();
    expect(lockEvent.props.isEmpty, true);
  });

  test('$LockAllUnlocked props', () {
    const LockAllUnlocked lockEvent = LockAllUnlocked();
    expect(lockEvent.props.isEmpty, true);
  });

  test('$LockChanged props', () {
    const LockChanged lockEvent1 = LockChanged(0, onlyLock: true);
    expect(lockEvent1.props, <Object>[0, true]);
    const LockChanged lockEvent2 = LockChanged(0);
    expect(lockEvent2.props, <Object>[0, false]);
    expect(lockEvent1, isNot(equals(lockEvent2)));
    const LockChanged lockEvent3 = LockChanged(0);
    expect(lockEvent2, equals(lockEvent3));
  });
}
