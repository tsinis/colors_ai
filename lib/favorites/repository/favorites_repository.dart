import '../../core/models/color_palette/color_palette.dart';
import '../mixins/favorites_storage.dart';

class FavoritesRepository with FavoritesStorage {
  const FavoritesRepository(this._palettes);

  final List<ColorPalette> _palettes;

  List<ColorPalette> get palettes => _palettes;

  void add(ColorPalette palette) => _palettes.add(palette);

  void remove(Set<int> indexes) {
    final Set<int> palettesToRemove = Set<int>.from(indexes);
    if (palettesToRemove.length == _palettes.length || palettesToRemove.isEmpty) {
      _palettes.clear();
    } else if (palettesToRemove.length == 1) {
      _palettes.removeAt(palettesToRemove.first);
    } else {
      final Map<int, ColorPalette> indexMap = Map<int, ColorPalette>.from(_palettes.asMap())
        ..removeWhere((index, _) => palettesToRemove.contains(index));
      _palettes
        ..clear()
        ..addAll(indexMap.values);
    }
  }

  Future<bool> get loadStoredFavorites async {
    _palettes
      ..clear()
      ..addAll(await storedFavorites);
    return _palettes.isNotEmpty;
  }
}
