import 'package:colors_ai/core/models/color_palette/color_palette.dart';
import 'package:colors_ai/favorites/services/storage_providers/favorites_hive_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

import '../../../data/fakes/fake_hive_box.dart';
import '../../../utils/fake_box_verify.dart';
import '../../data.dart';

void main() => group('$FavoritesHiveStorage', () {
      late FakeHiveBox<ColorPalette> fakeBox;
      late FavoritesHiveStorage favoritesStorage;

      setUpAll(() => Hive.init('./'));

      setUp(() {
        fakeBox = FakeHiveBox<ColorPalette>.empty();
        favoritesStorage = FavoritesHiveStorage(openedBox: fakeBox);
      });

      test('doMigration() with null old data', () async {
        verifyNoBoxInteractions(fakeBox);
        await favoritesStorage.doMigration(null);
        final Iterable<ColorPalette> storedValues = fakeBox.values;
        expect(storedValues.isEmpty, true);
        verifyNoBoxInteractions(fakeBox);
      });

      test('doMigration() with non-null old data', () async {
        verifyNoBoxInteractions(fakeBox);
        await favoritesStorage.doMigration(<ColorPalette>[palette]);
        final Iterable<ColorPalette> storedValues = fakeBox.values;
        expect(storedValues.length, 1);
        expect(storedValues.first, palette);
        verifyNoBoxInteractions(fakeBox, shouldBeOpen: true, shouldBeEmpty: false);
      });

      test('storedFavorites on first run', () async {
        verifyNoBoxInteractions(fakeBox);
        final Iterable<ColorPalette> palettes = await favoritesStorage.storedFavorites;
        expect(palettes.isEmpty, true);
        verifyNoBoxInteractions(fakeBox);
      });

      test(
        'add()',
        () async {
          verifyNoBoxInteractions(fakeBox);
          Iterable<ColorPalette> palettes = await favoritesStorage.storedFavorites;
          expect(palettes.isEmpty, true);
          verifyNoBoxInteractions(fakeBox);
          await favoritesStorage.add(colors);
          final Iterable<ColorPalette> storedValues = fakeBox.values;
          expect(storedValues.length, 2);
          expect(storedValues.first, transparentColor);
          verifyNoBoxInteractions(fakeBox, shouldBeEmpty: false);
          palettes = await favoritesStorage.storedFavorites;
          expect(palettes.length, 2);
          expect(palettes.first, transparentColor);
          verifyNoBoxInteractions(fakeBox, shouldBeEmpty: false);
        },
        skip: true,
      );

      test(
        'storedFavorites from corrupted storage',
        () async {
          final FakeHiveBox<ColorPalette> corruptedBox = FakeHiveBox<ColorPalette>.corruptedEmpty();
          final FavoritesHiveStorage corruptedStorage = FavoritesHiveStorage(openedBox: corruptedBox);
          verifyNoBoxInteractions(corruptedBox);
          final Iterable<ColorPalette> palettes = await corruptedStorage.storedFavorites;
          expect(palettes.isEmpty, true);
          verifyNoBoxInteractions(corruptedBox);
        },
        skip: true,
      );
    });
