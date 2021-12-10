import '../../../core/models/typedef_aliases/is_locked.dart';
import '../../interfaces/lock_interface.dart';
import '../../interfaces/manipulate_list_interface.dart';

class LockedColors implements ManipulateListInterface<IsLocked>, LockInterface {
  @override
  final List<IsLocked> list;

  static const IsLocked _locked = true;
  static const IsLocked _unlocked = false;

  const LockedColors({this.list = const []});

  @override
  void add([IsLocked isLocked = _unlocked]) => list.add(isLocked);

  @override
  void addAll(List<IsLocked> newLocks) => list
    ..clear()
    ..addAll(newLocks);

  @override
  void lock(int colorIndex) => list
    ..removeAt(colorIndex)
    ..insert(colorIndex, _locked);

  @override
  void swap({required int oldIndex, required int newIndex}) {
    final IsLocked swapedLock = list[oldIndex];
    if (newIndex > list.length - 1) {
      list
        ..removeAt(oldIndex)
        ..add(swapedLock);
    } else {
      list
        ..removeAt(oldIndex)
        ..insert(newIndex, swapedLock);
    }
  }

  @override
  void unlockAll() => list.replaceRange(0, list.length, List<IsLocked>.filled(list.length, _unlocked));

  void change(int colorIndex) {
    final IsLocked invertedLock = !list[colorIndex];
    list
      ..removeAt(colorIndex)
      ..insert(colorIndex, invertedLock);
  }
}
