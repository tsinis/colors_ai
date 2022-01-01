class RemoveFavoritesRepository {
  final Set<int> _selections;

  Set<int> get selections => _selections;

  const RemoveFavoritesRepository(this._selections);

  void changeSelection(int i) => _isSelected(i) ? _selections.remove(i) : _selections.add(i);

  void clearSelections() => _selections.clear();

  bool _isSelected(int index) => _selections.contains(index);
}
