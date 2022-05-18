import 'package:bloc_test/bloc_test.dart';
import 'package:colors_ai/favorites/blocs/remove_favorites/remove_favorites_bloc.dart';
import 'package:colors_ai/favorites/repository/remove_favorites_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => group('$RemoveFavoritesBloc', () {
      late RemoveFavoritesRepository removeFavsRepository;

      setUp(() => removeFavsRepository = RemoveFavoritesRepository(Set<int>.from(<int>{0})));

      blocTest<RemoveFavoritesBloc, void>(
        'on Initial',
        build: () => RemoveFavoritesBloc(removeFavsRepository),
        expect: () => isEmpty,
      );

      blocTest<RemoveFavoritesBloc, RemoveFavoritesState>(
        '$RemoveFavoritesShowed',
        build: () => RemoveFavoritesBloc(removeFavsRepository),
        act: (RemoveFavoritesBloc bloc) => bloc.add(const RemoveFavoritesShowed()),
        expect: () => <TypeMatcher<RemoveFavoritesState>>[isA<RemoveFavoritesOpenDialogInitial>()],
        verify: (RemoveFavoritesBloc bloc) => expect(bloc.state.selections, const <int>{0}),
      );

      blocTest<RemoveFavoritesBloc, RemoveFavoritesState>(
        '$RemoveFavoritesRemoved',
        build: () => RemoveFavoritesBloc(removeFavsRepository),
        act: (RemoveFavoritesBloc bloc) => bloc.add(const RemoveFavoritesRemoved()),
        expect: () => <TypeMatcher<RemoveFavoritesState>>[
          isA<RemoveFavoritesSelectionSelected>(),
          isA<RemoveFavoritesSelectionChanged>(),
        ],
        verify: (RemoveFavoritesBloc bloc) => expect(bloc.state.selections.isEmpty, true),
      );

      blocTest<RemoveFavoritesBloc, RemoveFavoritesState>(
        '$RemoveFavoritesSelected',
        build: () => RemoveFavoritesBloc(removeFavsRepository),
        act: (RemoveFavoritesBloc bloc) => bloc.add(const RemoveFavoritesSelected(0)),
        expect: () => <TypeMatcher<RemoveFavoritesState>>[
          isA<RemoveFavoritesSelectionSelected>(),
          isA<RemoveFavoritesSelectionChanged>(),
        ],
        verify: (RemoveFavoritesBloc bloc) => expect(bloc.state.selections.isEmpty, true),
      );

      blocTest<RemoveFavoritesBloc, RemoveFavoritesState>(
        '$RemoveFavoritesHided',
        build: () => RemoveFavoritesBloc(removeFavsRepository),
        act: (RemoveFavoritesBloc bloc) => bloc.add(const RemoveFavoritesHided()),
        expect: () => <TypeMatcher<RemoveFavoritesState>>[isA<RemoveFavoritesSelectionChanged>()],
        verify: (RemoveFavoritesBloc bloc) => expect(bloc.state.selections, const <int>{0}),
      );
    });
