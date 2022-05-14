import 'dart:io';

import 'package:colors_ai/core/models/color_palette/color_palette.dart';
import 'package:colors_ai/favorites/services/storage_providers/favorites_hive_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

import '../../../data/helpers/utils.dart';
import '../../data.dart';

void main() => group('$FavoritesHiveStorage', () {
      late FavoritesHiveStorage favoritesStorage;

      setUpAll(() => Hive.init('./hive_test'));

      setUp(() => favoritesStorage = FavoritesHiveStorage(boxName: uniqueBoxName));

      test('doMigration() with null old data', () async {
        await favoritesStorage.doMigration(null);
        final Iterable<ColorPalette> palettes = await favoritesStorage.storedFavorites;
        expect(palettes.isEmpty, true);
      });

      test('storedFavorites on first run', () async {
        final Iterable<ColorPalette> palettes = await favoritesStorage.storedFavorites;
        expect(palettes.isEmpty, true);
      });

      test('doMigration() with non-null old data', () async {
        await favoritesStorage.doMigration(<ColorPalette>[palette]);
        final Iterable<ColorPalette> palettes = await favoritesStorage.storedFavorites;
        expect(palettes, <ColorPalette>[palette]);
      });

      test('add() and then storedFavorites', () async {
        Iterable<ColorPalette> palettes = await favoritesStorage.storedFavorites;
        expect(palettes.isEmpty, true);
        await favoritesStorage.add(colors);
        palettes = await favoritesStorage.storedFavorites;
        expect(palettes.length, 1);
        expect(palettes.first, palette);
      });

      tearDownAll(() => Directory('hive_test').deleteSync(recursive: true));
    });
