abstract class ManipulateListInterface {
  final List list;

  const ManipulateListInterface(this.list);

  void swap({required int oldIndex, required int newIndex});

  void add(Object? value) => list.add(value);

  void addAll(List newList) => list
    ..clear()
    ..addAll(newList);
}
