class RemoveFavoritesRepository {
  const RemoveFavoritesRepository(this._selections);
  final Set<int> _selections;

  Set<int> get selectons => _selections;

  bool _isSelected(int index) => _selections.contains(index);

  void changeSelection(int i) => (_isSelected(i)) ? _selections.remove(i) : _selections.add(i);
}
