import 'dart:ui';

import '../../core/extensions/color_palette_extension.dart';
import '../../core/models/color_palette/color_palette.dart';
import '../interfaces/favorites_storage.dart';

class FavoritesRepository {
  final List<ColorPalette> _palettes;
  final FavoritesStorage _storage;

  Future<bool> get loadStoredFavorites async {
    final Iterable<ColorPalette> stored = await _storage.storedFavorites;
    _palettes.addAll(stored);

    return stored.isNotEmpty;
  }

  List<ColorPalette> get palettes => _palettes;

  FavoritesStorage get storage => _storage;

  const FavoritesRepository(List<ColorPalette> palettes, FavoritesStorage storage)
      : _palettes = palettes,
        _storage = storage;

  void add(List<Color> colors) => _palettes.add(colors.toPalette());

  void remove(Set<int> indexes) {
    if (_palettes.isEmpty) {
      return;
    }
    final Set<int> palettesToRemove = Set<int>.unmodifiable(indexes);
    final List<ColorPalette> storedPalettes = List<ColorPalette>.of(_palettes);
    _palettes.clear();

    switch (palettesToRemove.length) {
      case 0:
        return;
      case 1:
        storedPalettes.removeAt(palettesToRemove.first);
        _palettes.addAll(storedPalettes);
        return;
      default:
        final Map<int, ColorPalette> indexMap = Map<int, ColorPalette>.of(storedPalettes.asMap())
          ..removeWhere((int index, _) => palettesToRemove.contains(index));
        _palettes.addAll(indexMap.values);
    }
  }
}
