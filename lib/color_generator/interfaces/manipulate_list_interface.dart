abstract class ManipulateListInterface<T> {
  final List<T> _list;

  List<T> get list => _list;

  const ManipulateListInterface(this._list);

  void swap({required int oldIndex, required int newIndex});

  void add(T value) => _list.add(value);

  void addAll(List<T> newList) => _list
    ..clear()
    ..addAll(newList);
}
