import 'package:equatable/equatable.dart';

abstract class ManipulateListInterface<T> extends Equatable {
  final List<T> _list;

  List<T> get list => _list;

  @override
  List<T> get props => _list;

  const ManipulateListInterface(this._list);

  void add(T value) => _list.add(value);

  void addAll(List<T> newList) => _list
    ..clear()
    ..addAll(newList);

  void change(int index, T newValue) {
    if (index < list.length) {
      list[index] = newValue;
    }
  }

  void swap({required int oldIndex, required int newIndex}) {
    final T swappedValue = list[oldIndex];
    if (newIndex >= list.length) {
      list
        ..removeAt(oldIndex)
        ..add(swappedValue);
    } else {
      list
        ..removeAt(oldIndex)
        ..insert(newIndex, swappedValue);
    }
  }
}
