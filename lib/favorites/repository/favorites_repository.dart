import '../../general/models/color_palette/color_palette.dart';
import '../mixins/favorites_storage.dart';

class FavoritesRepository with FavoritesStorage {
  const FavoritesRepository(this._palettes);

  final List<ColorPalette> _palettes;

  List<ColorPalette> get palettes => _palettes;

  void add(ColorPalette palette) => _palettes.add(palette);

  void remove(int colorIndex) => _palettes.removeAt(colorIndex);

  void removeAll() => _palettes.clear();

  Future<bool> get loadStoredFavorites async {
    _palettes
      ..clear()
      ..addAll(await storedFavorites);
    return _palettes.isNotEmpty;
  }
}
