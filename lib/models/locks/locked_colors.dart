import '../../services/api/constants.dart';

class LockedColors {
  final List<bool> _list = [false, false, false, false, false];

  List<bool> get list => _list;

  void swapLocks({required int oldIndex, required int newIndex}) {
    final bool swapedLock = _list[oldIndex];
    if (newIndex > defaultColorLocks.length - 1) {
      _list
        ..removeAt(oldIndex)
        ..add(swapedLock);
    } else {
      _list
        ..removeAt(oldIndex)
        ..insert(newIndex, swapedLock);
    }
  }

  void changeLock(int colorIndex) {
    final bool invertedLock = !_list[colorIndex];
    _list
      ..removeAt(colorIndex)
      ..insert(colorIndex, invertedLock);
  }
}
