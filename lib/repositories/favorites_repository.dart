import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/hive/color_adapter.dart';
import '../models/hive/color_palette.dart';

class FavoritesRepository {
  const FavoritesRepository();

  static const String _favoritesBox = 'favorite';
  static final List<ColorPalette> _list = [];
  static Box<ColorPalette> _storageBox = Hive.box(_favoritesBox);

  List<ColorPalette> get list => _list;

  void add(ColorPalette palette) => _list.add(palette);

  void remove(int colorIndex) => _list.removeAt(colorIndex);

  void removeAll() => _list.clear();

  Future<Box<ColorPalette>> get _openBoxStorage => Hive.openBox<ColorPalette>(_favoritesBox);

  Future<void> clearStorage() => _storageBox.clear();

  Future<void> addToStorage() => _storageBox.add(_list.last);

  Future<void> updateStorage() async {
    await clearStorage();
    for (final ColorPalette colors in _list) {
      await _storageBox.add(colors);
    }
  }

  Future<bool?> get loadStoredFavorites async {
    try {
      Hive..registerAdapter(ColorPaletteAdapter())..registerAdapter(ColorAdapter());
      _storageBox = await _openBoxStorage;
      _list.clear();
      _storageBox.values.forEach(_list.add);
      return _list.isNotEmpty;
    } on Exception catch (e) {
      debugPrint('Exception during favorites box opening: $e');
      return false;
    }
  }
}
