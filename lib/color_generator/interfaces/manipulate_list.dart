import 'dart:ui' show Color;

abstract class ManipulateListInterface {
  const ManipulateListInterface(this.list);
  final List list;

  void swap({required int oldIndex, required int newIndex});
  void change(int colorIndex, [Color? color]);
  void add(dynamic value) => list.add(value);
  void addAll(List newList) => list
    ..clear()
    ..addAll(newList);
}
