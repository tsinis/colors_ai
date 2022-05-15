import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../core/interfaces/storage_interfaces/hive_storage_interface.dart';
import '../../../core/models/color_palette/color_palette.dart';
import '../../interfaces/favorites_storage.dart';
import '../../models/color_adapter.dart';

class FavoritesHiveStorage extends HiveStorageInterface<ColorPalette> implements FavoritesStorage {
  @override
  Future<Iterable<ColorPalette>> get storedFavorites async {
    try {
      _registerAdapters();
      final Box<ColorPalette> storageBox = await openBox;

      return storageBox.values;
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      debugPrint('Exception during favorites box opening: $e');

      return <ColorPalette>[];
    }
  }

  @override
  List<ColorPalette> get palettes => _storageBox.values.toList();

  Box<ColorPalette> get _storageBox => Hive.box(boxName);

  const FavoritesHiveStorage({HiveCipher? encryption, String boxName = 'favorite'})
      : super(encryption, boxName: boxName);

  @override
  Future<void> clear() => _storageBox.clear();

  @override
  Future<void> add(List<Color> colors) => _storageBox.add(ColorPalette(colors: List<Color>.unmodifiable(colors)));

  @override
  Future<int> update(Set<int> indexes) async {
    final List<ColorPalette> storedPalettes = palettes;
    final Set<int> palettesToRemove = Set<int>.unmodifiable(indexes);
    await clear();
    switch (palettesToRemove.length) {
      case 0:
        return 0;
      case 1:
        storedPalettes.removeAt(palettesToRemove.first);
        await _storageBox.addAll(List<ColorPalette>.unmodifiable(storedPalettes));
        return 1;
      default:
        final Map<int, ColorPalette> indexMap = Map<int, ColorPalette>.from(storedPalettes.asMap())
          ..removeWhere((int index, _) => palettesToRemove.contains(index));
        await _storageBox.addAll(indexMap.values);
        return palettesToRemove.length;
    }
  }

  @override
  Future<void> doMigration(covariant Iterable<ColorPalette>? oldData) async {
    if (oldData == null) {
      return;
    }

    _registerAdapters();
    final Box<ColorPalette> storageBox = await openBox;
    await storageBox.addAll(oldData);
  }

  void _registerAdapters() {
    if (!Hive.isAdapterRegistered(ColorAdapter().typeId)) {
      Hive
        ..registerAdapter(ColorPaletteAdapter())
        ..registerAdapter(ColorAdapter());
    }
  }
}
