import 'dart:ui';

import '../../core/models/color_palette/color_palette.dart';
import '../interfaces/favorites_storage.dart';
import '../services/storage_providers.dart/hive_storage.dart';

class FavoritesRepository {
  final List<ColorPalette> _palettes;
  final FavoritesStorage _storage;

  Future<bool> get loadStoredFavorites async {
    final Iterable<ColorPalette> stored = await _storage.storedFavorites;
    _palettes
      ..clear()
      ..addAll(stored);

    return stored.isNotEmpty;
  }

  List<ColorPalette> get palettes => _palettes;

  FavoritesStorage get storage => _storage;

  const FavoritesRepository(List<ColorPalette> palettes, {FavoritesStorage storage = const HiveStorage()})
      : _palettes = palettes,
        _storage = storage;

  void add(List<Color> colors) => _palettes.add(ColorPalette(colors: List<Color>.unmodifiable(colors)));

  void remove(Set<int> indexes) {
    final Set<int> palettesToRemove = Set<int>.unmodifiable(indexes);
    switch (palettesToRemove.length) {
      case 0:
        return;
      case 1:
        final List<ColorPalette> newPalettes = List<ColorPalette>.from(_palettes)..removeAt(palettesToRemove.first);
        _palettes
          ..clear()
          ..addAll(newPalettes);
        return;
      default:
        final Map<int, ColorPalette> indexMap = Map<int, ColorPalette>.from(_palettes.asMap())
          ..removeWhere((index, _) => palettesToRemove.contains(index));
        _palettes
          ..clear()
          ..addAll(indexMap.values);
    }
  }
}
