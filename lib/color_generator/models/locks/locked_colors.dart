import '../../../core/models/typedef_aliases/is_locked.dart';
import '../../interfaces/lock_interface.dart';
import '../../interfaces/manipulate_list_interface.dart';

class LockedColors extends ManipulateListInterface<IsLocked> implements LockInterface {
  @override
  final List<IsLocked> list;

  static const IsLocked _locked = true;
  static const IsLocked _unlocked = false;

  const LockedColors({this.list = const <IsLocked>[]}) : super(list);

  @override
  void lock(int colorIndex) => list
    ..removeAt(colorIndex)
    ..insert(colorIndex, _locked);

  @override
  void unlockAll() => list.replaceRange(0, list.length, List<IsLocked>.filled(list.length, _unlocked));

  @override
  void change(int index, bool newValue) {
    final IsLocked invertedLock = !list[index];
    list
      ..removeAt(index)
      ..insert(index, invertedLock);
  }
}
