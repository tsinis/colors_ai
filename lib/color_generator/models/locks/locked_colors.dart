import '../../../core/models/typedef_aliases/is_locked.dart';
import '../../interfaces/manipulate_list_interface.dart';

class LockedColors extends ManipulateListInterface<IsLocked> {
  static const IsLocked _locked = true;
  static const IsLocked _unlocked = false;

  const LockedColors({List<IsLocked> list = const <IsLocked>[]}) : super(list);

  void lock(int colorIndex) {
    if (colorIndex < list.length) {
      list
        ..removeAt(colorIndex)
        ..insert(colorIndex, _locked);
    }
  }

  void unlockAll() => list.replaceRange(0, list.length, List<IsLocked>.filled(list.length, _unlocked));

  @override
  void change(int index, bool newValue) {
    if (index < list.length) {
      final IsLocked invertedLock = !list[index];
      list
        ..removeAt(index)
        ..insert(index, invertedLock);
    }
  }
}
