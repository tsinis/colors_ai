import 'dart:ui';

import 'package:colors_ai/color_generator/models/colors/constants.dart';
import 'package:colors_ai/color_generator/models/locks/locked_colors.dart';
import 'package:colors_ai/core/models/color_palette/color_palette.dart';
import 'package:colors_ai/core/repository/colors_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => group('$ColorsRepository', () {
      late LockedColors lockedColors;
      late ColorPalette colorPalette;
      late ColorsRepository colorsRepository;

      setUp(() {
        lockedColors = LockedColors(list: List<bool>.of(<bool>[]));
        colorPalette = ColorPalette(colors: List<Color>.of(<Color>[]));
        colorsRepository = ColorsRepository(
          colorPalette: colorPalette,
          lockedColors: lockedColors,
          getNewColors: (_, __) async => const ColorPalette(colors: kDefaultColors),
        );
      });

      test('palette', () => expect(colorsRepository.palette, colorPalette));

      test('lockedColors', () => expect(colorsRepository.lockedColors, lockedColors.list));

      test('init()', () {
        colorsRepository.init();
        expect(colorsRepository.palette, const ColorPalette(colors: kDefaultColors));
        expect(colorsRepository.lockedColors, kDefaultColors.map((Color c) => false));
      });

      test('changeColor() with valid index', () {
        colorsRepository.init();
        expect(colorsRepository.palette, const ColorPalette(colors: kDefaultColors));
        colorsRepository.changeColor(kDefaultColors.last, 0);
        expect(
          colorsRepository.palette,
          ColorPalette(
            colors: <Color>[
              kDefaultColors.last,
              kDefaultColors.elementAt(1),
              kDefaultColors.elementAt(2),
              kDefaultColors.elementAt(3),
              kDefaultColors.last,
            ],
          ),
        );
      });

      test('changeColor() with invalid index', () {
        colorsRepository.init();
        expect(colorsRepository.palette, const ColorPalette(colors: kDefaultColors));
        colorsRepository.changeColor(kDefaultColors.last, kDefaultColors.length);
        expect(colorsRepository.palette, const ColorPalette(colors: kDefaultColors));
      });

      test('changeLock() with valid index', () {
        colorsRepository.init();
        expect(colorsRepository.lockedColors, kDefaultColors.map((Color c) => false));
        colorsRepository.changeLock(0);
        expect(
          colorsRepository.lockedColors,
          <bool>[true, false, false, false, false],
        );
      });

      test('changeLock() with invalid index', () {
        colorsRepository.init();
        expect(colorsRepository.lockedColors, kDefaultColors.map((Color c) => false));
        colorsRepository.changeLock(kDefaultColors.length);
        expect(colorsRepository.lockedColors, kDefaultColors.map((Color c) => false));
      });

      test('fromFavorites()', () {
        expect(colorsRepository.palette.list.isEmpty, true);
        colorsRepository.fromFavorites(const ColorPalette(colors: kDefaultColors));
        expect(colorsRepository.palette, const ColorPalette(colors: kDefaultColors));
      });

      test('getNewColors() without exception', () async {
        colorsRepository.lockedColors.add(false);
        expect(colorsRepository.palette.list.isEmpty, true);
        final bool isFetched = await colorsRepository.getNewColors();
        expect(isFetched, true);
        expect(colorsRepository.palette.list.isEmpty, false);
      });

      test('getNewColors() with exception', () async {
        final ColorsRepository repository = ColorsRepository(
          colorPalette: colorPalette,
          lockedColors: lockedColors,
          getNewColors: (_, __) async => throw Exception(),
        );
        repository.lockedColors.add(false);
        expect(repository.palette.list.isEmpty, true);
        final bool isFetched = await repository.getNewColors();
        expect(isFetched, false);
        expect(repository.palette.list.isEmpty, true);
      });

      test('getNewColors() with all locked colors', () async {
        final bool isFetched = await colorsRepository.getNewColors();
        expect(colorsRepository.palette.list.isEmpty, true);
        expect(isFetched, true);
      });

      test('lock() with valid index', () {
        colorsRepository.init();
        expect(colorsRepository.lockedColors, kDefaultColors.map((Color c) => false));
        colorsRepository.lock(0);
        expect(
          colorsRepository.lockedColors,
          <bool>[true, false, false, false, false],
        );
      });

      test('lock() with invalid index', () {
        colorsRepository.init();
        expect(colorsRepository.lockedColors, kDefaultColors.map((Color c) => false));
        colorsRepository.lock(colorsRepository.lockedColors.length);
        expect(colorsRepository.lockedColors, kDefaultColors.map((Color c) => false));
      });

      test('swapColors()', () {
        colorsRepository.init();
        expect(colorsRepository.palette, const ColorPalette(colors: kDefaultColors));
        expect(colorsRepository.lockedColors, kDefaultColors.map((Color c) => false));
        colorsRepository.lock(0);
        expect(
          colorsRepository.lockedColors,
          <bool>[true, false, false, false, false],
        );
        colorsRepository.swapColors(oldIndex: 0, newIndex: colorsRepository.lockedColors.length);
        expect(
          colorsRepository.palette,
          ColorPalette(
            colors: <Color>[
              kDefaultColors.elementAt(1),
              kDefaultColors.elementAt(2),
              kDefaultColors.elementAt(3),
              kDefaultColors.last,
              kDefaultColors.first,
            ],
          ),
        );
        expect(
          colorsRepository.lockedColors,
          <bool>[false, false, false, false, true],
        );
      });

      test('unlockAll()', () {
        colorsRepository.init();
        expect(colorsRepository.lockedColors, kDefaultColors.map((Color c) => false));
        colorsRepository
          ..lock(0)
          ..lock(colorsRepository.lockedColors.length - 1);
        expect(
          colorsRepository.lockedColors,
          <bool>[true, false, false, false, true],
        );
        colorsRepository.unlockAll();
        expect(colorsRepository.lockedColors, kDefaultColors.map((Color c) => false));
      });
    });
