import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../core/models/color_palette/color_palette.dart';
import '../models/color_adapter.dart';

mixin FavoritesStorage {
  static const String _favoritesBox = 'favorite';

  static Box<ColorPalette> _storageBox = Hive.box(_favoritesBox);

  Future<Box<ColorPalette>> get _openBoxStorage => Hive.openBox<ColorPalette>(_favoritesBox);

  Future<void> clearStorage() => _storageBox.clear();
  Future<void> addToStorage(ColorPalette palette) => _storageBox.add(palette);

  Future<void> updateStorage(Set<int> indexes) async {
    final Set<int> palettesToRemove = Set<int>.unmodifiable(indexes);
    final List<ColorPalette> storedList = List<ColorPalette>.from(_storageBox.values);
    await clearStorage();
    if (palettesToRemove.length == _storageBox.keys.length || palettesToRemove.isEmpty) {
      return;
    } else if (palettesToRemove.length == 1) {
      storedList.removeAt(palettesToRemove.first);
      await _storageBox.addAll(storedList);
    } else {
      final Map<int, ColorPalette> indexMap = Map<int, ColorPalette>.from(storedList.asMap())
        ..removeWhere((index, _) => palettesToRemove.contains(index));
      await _storageBox.addAll(indexMap.values);
    }
  }

  Future<Iterable<ColorPalette>> get storedFavorites async {
    try {
      Hive
        ..registerAdapter(ColorPaletteAdapter())
        ..registerAdapter(ColorAdapter());
      _storageBox = await _openBoxStorage;

      return _storageBox.values;
    } on Exception catch (e) {
      debugPrint('Exception during favorites box opening: $e');

      return [];
    }
  }
}
