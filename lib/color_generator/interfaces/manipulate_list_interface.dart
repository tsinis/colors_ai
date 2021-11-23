abstract class ManipulateListInterface {
  const ManipulateListInterface(this.list);

  final List list;

  void swap({required int oldIndex, required int newIndex});

  void add(Object? value) => list.add(value);

  void addAll(List newList) => list
    ..clear()
    ..addAll(newList);
}
