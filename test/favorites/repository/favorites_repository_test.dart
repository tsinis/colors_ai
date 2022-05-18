// ignore_for_file: avoid_annotating_with_dynamic

import 'package:colors_ai/core/models/color_palette/color_palette.dart';
import 'package:colors_ai/favorites/interfaces/favorites_storage.dart';
import 'package:colors_ai/favorites/repository/favorites_repository.dart';
import 'package:colors_ai/favorites/services/storage_providers/favorites_hive_storage.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../data/helpers/utils.dart';
import '../data.dart';

void main() => group('$FavoritesRepository', () {
      late FavoritesHiveStorage favoritesStorage;
      late FavoritesRepository favoritesRepository;

      setUpAll(createFakeStorageDir);

      setUp(() {
        favoritesStorage = FavoritesHiveStorage(boxName: uniqueBoxName);
        favoritesRepository = FavoritesRepository(
          List<ColorPalette>.empty(growable: true),
          favoritesStorage,
        );
      });

      test('storage', () {
        final FavoritesStorage storage = favoritesRepository.storage;
        expect(storage, favoritesStorage);
      });

      test('palettes on first run', () {
        final List<ColorPalette> palettes = favoritesRepository.palettes;
        expect(palettes.isEmpty, true);
      });

      test('loadStoredFavorites', () async {
        final bool isNotEmpty = await favoritesRepository.loadStoredFavorites;
        expect(isNotEmpty, false);
        final List<ColorPalette> palettes = favoritesRepository.palettes;
        expect(palettes.isEmpty, true);
      });

      test('add()', () {
        final List<ColorPalette> palettes = favoritesRepository.palettes;
        expect(palettes.isEmpty, true);
        favoritesRepository.add(colors);
        expect(palettes.length, 1);
        expect(palettes.first, palette);
      });

      test('update() with empty indexes', () async {
        List<ColorPalette> palettes = favoritesRepository.palettes;
        expect(palettes.isEmpty, true);
        favoritesRepository.add(colors);
        palettes = favoritesRepository.palettes;
        expect(palettes.length, 1);
        expect(palettes.first, palette);
        favoritesRepository.remove(<int>{});
        palettes = favoritesRepository.palettes;
        expect(palettes.length, 1);
        expect(palettes.first, palette);
      });

      test('update() with single index', () async {
        List<ColorPalette> palettes = favoritesRepository.palettes;
        expect(palettes.isEmpty, true);
        favoritesRepository
          ..add(colors)
          ..add(colors.reversed.toList());
        palettes = favoritesRepository.palettes;
        expect(palettes.length, 2);
        expect(palettes.first, palette);
        favoritesRepository.remove(<int>{1});
        palettes = favoritesRepository.palettes;
        expect(palettes.length, 1);
        expect(palettes.first, palette);
      });

      test('update() with multiple indexes', () async {
        List<ColorPalette> palettes = favoritesRepository.palettes;
        expect(palettes.isEmpty, true);
        favoritesRepository
          ..add(colors)
          ..add(colors.reversed.toList())
          ..add(colors);
        palettes = favoritesRepository.palettes;
        expect(palettes.length, 3);
        expect(palettes.first, palette);
        favoritesRepository.remove(<int>{0, 1});
        palettes = favoritesRepository.palettes;
        expect(palettes.length, 1);
        expect(palettes.first, palette);
      });

      tearDownAll(deleteFakeStorageDir);
    });
