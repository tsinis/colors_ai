import 'dart:ui' show Color;

import '../../core/models/color_palette/color_palette.dart';

abstract class FavoritesStorage {
  Future<Iterable<ColorPalette>> get storedFavorites;

  List<ColorPalette> get palettes;

  Future<void> clear();

  Future<void> add(List<Color> colors);

  Future<void> update(Set<int> indexes);
}
