import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../core/models/color_palette/color_palette.dart';
import '../../interfaces/favorites_storage.dart';
import '../../models/color_adapter.dart';

class HiveStorage implements FavoritesStorage {
  final String name;

  @override
  Future<Iterable<ColorPalette>> get storedFavorites async {
    try {
      Hive
        ..registerAdapter(ColorPaletteAdapter())
        ..registerAdapter(ColorAdapter());
      await Hive.openBox<ColorPalette>(name);

      return _storageBox.values;
    } on Exception catch (e) {
      debugPrint('Exception during favorites box opening: $e');

      return <ColorPalette>[];
    }
  }

  @override
  List<ColorPalette> get palettes => _storageBox.values.toList();

  Box<ColorPalette> get _storageBox => Hive.box(name);

  const HiveStorage({this.name = 'favorite'});

  @override
  Future<void> clear() => _storageBox.clear();

  @override
  Future<void> add(List<Color> colors) => _storageBox.add(ColorPalette(colors: List<Color>.unmodifiable(colors)));

  @override
  Future<void> update(Set<int> indexes) async {
    final List<ColorPalette> storedList = List<ColorPalette>.from(_storageBox.values);
    final Set<int> palettesToRemove = Set<int>.unmodifiable(indexes);
    await clear();
    switch (palettesToRemove.length) {
      case 0:
        return;
      case 1:
        storedList.removeAt(palettesToRemove.first);
        await _storageBox.addAll(List<ColorPalette>.unmodifiable(storedList));
        return;
      default:
        final Map<int, ColorPalette> indexMap = Map<int, ColorPalette>.from(storedList.asMap())
          ..removeWhere((int index, _) => palettesToRemove.contains(index));
        await _storageBox.addAll(indexMap.values);
    }
  }
}
