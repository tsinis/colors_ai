import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../general/models/color_palette/color_palette.dart';
import '../models/color_adapter.dart';

mixin FavoritesStorage {
  static const String _favoritesBox = 'favorite';

  static Box<ColorPalette> _storageBox = Hive.box(_favoritesBox);

  Future<Box<ColorPalette>> get _openBoxStorage => Hive.openBox<ColorPalette>(_favoritesBox);

  Future<void> clearStorage() => _storageBox.clear();
  Future<void> addToStorage(ColorPalette palette) => _storageBox.add(palette);
  Future<void> updateStorage(int index) => _storageBox.deleteAt(index);

  Future<Iterable<ColorPalette>> get storedFavorites async {
    try {
      Hive..registerAdapter(ColorPaletteAdapter())..registerAdapter(ColorAdapter());
      _storageBox = await _openBoxStorage;
      return _storageBox.values;
    } on Exception catch (e) {
      debugPrint('Exception during favorites box opening: $e');
      return [];
    }
  }
}
