// ignore_for_file: avoid_annotating_with_dynamic

import 'dart:ui';

import 'package:bloc_test/bloc_test.dart';
import 'package:colors_ai/core/models/color_palette/color_palette.dart';
import 'package:colors_ai/favorites/blocs/list_favorites/favorites_bloc.dart';
import 'package:colors_ai/favorites/repository/favorites_repository.dart';
import 'package:colors_ai/favorites/services/storage_providers/favorites_hive_storage.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../data/helpers/utils.dart';
import '../../data.dart';

void main() => group('$FavoritesBloc', () {
      late FavoritesRepository favoritesRepository;

      setUpAll(createFakeStorageDir);

      setUp(
        () async {
          favoritesRepository = FavoritesRepository(
            List<ColorPalette>.empty(growable: true),
            FavoritesHiveStorage(boxName: uniqueBoxName),
          );
          await favoritesRepository.storage.storedFavorites;
        },
      );

      blocTest<FavoritesBloc, void>(
        'on Initial',
        build: () => FavoritesBloc(favoritesRepository),
        expect: () => isEmpty,
      );

      blocTest<FavoritesBloc, FavoritesState>(
        '$FavoritesStarted with empty storage',
        build: () => FavoritesBloc(favoritesRepository),
        act: (FavoritesBloc bloc) => bloc.add(const FavoritesStarted()),
        expect: () => <TypeMatcher<FavoritesState>>[
          isA<FavoritesLoadInProgress>(),
          isA<FavoritesEmptyInitial>(),
        ],
        verify: (FavoritesBloc bloc) => expect(favoritesRepository.palettes.isEmpty, true),
      );

      blocTest<FavoritesBloc, FavoritesState>(
        '$FavoritesStarted with filled storage',
        setUp: () async => favoritesRepository.storage.add(colors),
        build: () => FavoritesBloc(favoritesRepository),
        act: (FavoritesBloc bloc) => bloc.add(const FavoritesStarted()),
        expect: () => <TypeMatcher<FavoritesState>>[
          isA<FavoritesLoadInProgress>(),
          isA<FavoritesLoadSuccess>(),
        ],
        verify: (FavoritesBloc bloc) => expect(favoritesRepository.palettes, <ColorPalette>[palette]),
      );

      blocTest<FavoritesBloc, FavoritesState>(
        '$FavoritesAdded with empty favorite colors',
        build: () => FavoritesBloc(favoritesRepository),
        act: (FavoritesBloc bloc) => bloc.add(const FavoritesAdded(favorite: <Color>[])),
        expect: () => <TypeMatcher<FavoritesState>>[isA<FavoritesEmptyInitial>()],
        verify: (FavoritesBloc bloc) {
          expect(favoritesRepository.storage.palettes.isEmpty, true);
          expect(favoritesRepository.palettes.isEmpty, true);
        },
      );

      blocTest<FavoritesBloc, FavoritesState>(
        '$FavoritesAdded with filled favorite colors',
        build: () => FavoritesBloc(favoritesRepository),
        act: (FavoritesBloc bloc) => bloc.add(const FavoritesAdded(favorite: colors)),
        expect: () => <TypeMatcher<FavoritesState>>[isA<FavoritesLoadSuccess>()],
        verify: (FavoritesBloc bloc) {
          expect(favoritesRepository.storage.palettes.isEmpty, false);
          expect(favoritesRepository.palettes.isEmpty, false);
        },
      );

      blocTest<FavoritesBloc, FavoritesState>(
        '$FavoritesOneRemoved with empty favorite colors',
        build: () => FavoritesBloc(favoritesRepository),
        act: (FavoritesBloc bloc) => bloc.add(const FavoritesOneRemoved(colorToRemoveIndex: 0)),
        expect: () => <TypeMatcher<FavoritesState>>[isA<FavoritesEmptyInitial>()],
        verify: (FavoritesBloc bloc) {
          expect(favoritesRepository.storage.palettes.isEmpty, true);
          expect(favoritesRepository.palettes.isEmpty, true);
        },
      );

      blocTest<FavoritesBloc, FavoritesState>(
        '$FavoritesOneRemoved with filled favorite colors',
        setUp: () => favoritesRepository
          ..add(colors.reversed.toList())
          ..add(colors),
        build: () => FavoritesBloc(favoritesRepository),
        act: (FavoritesBloc bloc) => bloc.add(const FavoritesOneRemoved(colorToRemoveIndex: 0)),
        expect: () => <TypeMatcher<FavoritesState>>[isA<FavoritesLoadSuccess>()],
        verify: (FavoritesBloc bloc) => expect(favoritesRepository.palettes, <ColorPalette>[palette]),
      );

      blocTest<FavoritesBloc, FavoritesState>(
        '$FavoritesSeveralRemoved removing all colors',
        setUp: () => favoritesRepository
          ..add(colors.reversed.toList())
          ..add(colors),
        build: () => FavoritesBloc(favoritesRepository),
        act: (FavoritesBloc bloc) => bloc.add(const FavoritesSeveralRemoved(<int>{0, 1})),
        expect: () => <TypeMatcher<FavoritesState>>[isA<FavoritesEmptyInitial>()],
        verify: (FavoritesBloc bloc) => expect(favoritesRepository.palettes.isEmpty, true),
      );

      blocTest<FavoritesBloc, FavoritesState>(
        '$FavoritesSeveralRemoved removing some colors, but not all',
        setUp: () => favoritesRepository
          ..add(colors.reversed.toList())
          ..add(colors),
        build: () => FavoritesBloc(favoritesRepository),
        act: (FavoritesBloc bloc) => bloc.add(const FavoritesSeveralRemoved(<int>{0})),
        expect: () => <TypeMatcher<FavoritesState>>[isA<FavoritesLoadSuccess>()],
        verify: (FavoritesBloc bloc) => expect(favoritesRepository.palettes, <ColorPalette>[palette]),
      );

      tearDownAll(deleteFakeStorageDir);
    });
