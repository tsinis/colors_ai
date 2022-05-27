// ignore_for_file: avoid_annotating_with_dynamic

import 'package:colors_ai/core/models/color_palette/color_palette.dart';
import 'package:colors_ai/favorites/services/storage_providers/favorites_hive_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

import '../../../data/helpers/utils.dart';
import '../../data.dart';

void main() => group('$FavoritesHiveStorage', () {
      late FavoritesHiveStorage favoritesStorage;

      setUpAll(createFakeStorageDir);

      setUp(() => favoritesStorage = FavoritesHiveStorage(boxName: uniqueBoxName));

      test('doMigration() with null old data', () async {
        await favoritesStorage.doMigration(null);
        final Iterable<ColorPalette> palettes = await favoritesStorage.storedFavorites;
        expect(palettes.isEmpty, true);
      });

      test('doMigration() with non-null old data', () async {
        await favoritesStorage.doMigration(<ColorPalette>[palette]);
        final Iterable<ColorPalette> palettes = await favoritesStorage.storedFavorites;
        expect(palettes, <ColorPalette>[palette]);
      });

      test('storedFavorites on first run', () async {
        final Iterable<ColorPalette> palettes = await favoritesStorage.storedFavorites;
        expect(palettes.isEmpty, true);
      });

      test(
        'palettes should throw error if $Box is closed',
        () => expect(
          () => favoritesStorage.palettes,
          throwsA((dynamic e) => e is HiveError),
        ),
      );

      test('palettes', () async {
        Iterable<ColorPalette> palettes = await favoritesStorage.storedFavorites;
        expect(palettes.isEmpty, true);
        palettes = favoritesStorage.palettes;
        expect(palettes.isEmpty, true);
      });

      test(
        'update() should throw error if $Box is closed',
        () => expect(
          () async => favoritesStorage.update(<int>{1}),
          throwsA((dynamic e) => e is HiveError),
        ),
      );

      test('update() with no indexes', () async {
        Iterable<ColorPalette> palettes = await favoritesStorage.storedFavorites;
        expect(palettes.isEmpty, true);
        await favoritesStorage.add(colors);
        palettes = favoritesStorage.palettes;
        expect(palettes.length, 1);
        expect(palettes.first, palette);
        final int updatedCount = await favoritesStorage.update(<int>{});
        expect(updatedCount, 0);
        palettes = favoritesStorage.palettes;
        expect(palettes.isEmpty, true);
      });

      test('update() with single index', () async {
        Iterable<ColorPalette> palettes = await favoritesStorage.storedFavorites;
        expect(palettes.isEmpty, true);
        await favoritesStorage.add(colors);
        await favoritesStorage.add(colors.reversed.toList());
        palettes = favoritesStorage.palettes;
        expect(palettes.length, 2);
        expect(palettes.first, palette);
        final int updatedCount = await favoritesStorage.update(<int>{1});
        expect(updatedCount, 1);
        palettes = favoritesStorage.palettes;
        expect(palettes.length, 1);
        expect(palettes.first, palette);
      });

      test('update() with multiple indexes', () async {
        Iterable<ColorPalette> palettes = await favoritesStorage.storedFavorites;
        expect(palettes.isEmpty, true);
        await favoritesStorage.add(colors);
        await favoritesStorage.add(colors.reversed.toList());
        palettes = favoritesStorage.palettes;
        expect(palettes.length, 2);
        expect(palettes.first, palette);
        final int updatedCount = await favoritesStorage.update(<int>{0, 1});
        expect(updatedCount, 2);
        palettes = favoritesStorage.palettes;
        expect(palettes.isEmpty, true);
      });

      test(
        'clear() should throw error if $Box is closed',
        () => expect(
          () async => favoritesStorage.clear(),
          throwsA((dynamic e) => e is HiveError),
        ),
      );

      test('clear()', () async {
        Iterable<ColorPalette> palettes = await favoritesStorage.storedFavorites;
        expect(palettes.isEmpty, true);
        await favoritesStorage.add(colors);
        palettes = favoritesStorage.palettes;
        expect(palettes.length, 1);
        expect(palettes.first, palette);
        await favoritesStorage.clear();
        palettes = favoritesStorage.palettes;
        expect(palettes.isEmpty, true);
      });

      test(
        'add() should throw error if $Box is closed',
        () => expect(
          () async => favoritesStorage.add(colors),
          throwsA((dynamic e) => e is HiveError),
        ),
      );

      test('add() and then storedFavorites', () async {
        Iterable<ColorPalette> palettes = await favoritesStorage.storedFavorites;
        expect(palettes.isEmpty, true);
        await favoritesStorage.add(colors);
        palettes = await favoritesStorage.storedFavorites;
        expect(palettes.length, 1);
        expect(palettes.first, palette);
      });

      tearDownAll(deleteFakeStorageDir);
    });
