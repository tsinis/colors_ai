import '../../interfaces/manipulate_list.dart';
import '../../interfaces/manipulate_lock.dart';

class LockedColors implements ManipulateListInterface, LockInterface {
  LockedColors({this.list = const []});

  @override
  final List<bool> list;

  @override
  void unlockAll() => list.replaceRange(0, list.length, List.filled(list.length, unlocked));

  @override
  void swap({required int oldIndex, required int newIndex}) {
    final bool swapedLock = list[oldIndex];
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
  void lock(int colorIndex) => list
    ..removeAt(colorIndex)
    ..insert(colorIndex, locked);

  @override
  void change(int colorIndex, [_]) {
    final bool invertedLock = !list[colorIndex];
    list
      ..removeAt(colorIndex)
      ..insert(colorIndex, invertedLock);
  }

  @override
  void add([covariant bool? isLocked]) => list.add(isLocked ?? unlocked);

  @override
  void addAll(covariant List<bool> newLocks) => list
    ..clear()
    ..addAll(newLocks);
}
