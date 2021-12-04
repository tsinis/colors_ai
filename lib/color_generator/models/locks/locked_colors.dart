import '../../interfaces/lock_interface.dart';
import '../../interfaces/manipulate_list_interface.dart';

class LockedColors implements ManipulateListInterface, LockInterface {
  @override
  final List<bool> list;

  static const bool _locked = true;
  static const bool _unlocked = false;

  LockedColors({this.list = const []});

  @override
  void add([covariant bool? isLocked]) => list.add(isLocked ?? _unlocked);

  @override
  void addAll(covariant List<bool> newLocks) => list
    ..clear()
    ..addAll(newLocks);

  @override
  void lock(int colorIndex) => list
    ..removeAt(colorIndex)
    ..insert(colorIndex, _locked);

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
  void unlockAll() => list.replaceRange(0, list.length, List.filled(list.length, _unlocked, growable: false));

  void change(int colorIndex) {
    final bool invertedLock = !list[colorIndex];
    list
      ..removeAt(colorIndex)
      ..insert(colorIndex, invertedLock);
  }
}
