import 'package:colors_ai/favorites/blocs/remove_favorites/remove_favorites_bloc.dart';
import 'package:colors_ai/favorites/repository/remove_favorites_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../data/helpers/test_stream_bloc.dart';

void main() => group('$RemoveFavoritesBloc', () {
      late RemoveFavoritesRepository removeFavsRepository;

      setUp(() => removeFavsRepository = RemoveFavoritesRepository(Set<int>.of(<int>{0})));

      streamBlocTest<RemoveFavoritesBloc, void>(
        'on Initial',
        build: () => RemoveFavoritesBloc(removeFavsRepository),
        expect: () => isEmpty,
      );

      streamBlocTest<RemoveFavoritesBloc, RemoveFavoritesState>(
        '$RemoveFavoritesShowed',
        build: () => RemoveFavoritesBloc(removeFavsRepository),
        act: (RemoveFavoritesBloc bloc) => bloc.add(const RemoveFavoritesShowed()),
        expect: () => <TypeMatcher<RemoveFavoritesState>>[isA<RemoveFavoritesOpenDialogInitial>()],
        verify: (RemoveFavoritesBloc bloc) => expect(bloc.state.selections, const <int>{0}),
      );

      streamBlocTest<RemoveFavoritesBloc, RemoveFavoritesState>(
        '$RemoveFavoritesRemoved',
        build: () => RemoveFavoritesBloc(removeFavsRepository),
        act: (RemoveFavoritesBloc bloc) => bloc.add(const RemoveFavoritesRemoved()),
        expect: () => <TypeMatcher<RemoveFavoritesState>>[
          isA<RemoveFavoritesSelectionSelected>(),
          isA<RemoveFavoritesSelectionChanged>(),
        ],
        verify: (RemoveFavoritesBloc bloc) => expect(bloc.state.selections.isEmpty, true),
      );

      streamBlocTest<RemoveFavoritesBloc, RemoveFavoritesState>(
        '$RemoveFavoritesSelected',
        build: () => RemoveFavoritesBloc(removeFavsRepository),
        act: (RemoveFavoritesBloc bloc) => bloc.add(const RemoveFavoritesSelected(0)),
        expect: () => <TypeMatcher<RemoveFavoritesState>>[
          isA<RemoveFavoritesSelectionSelected>(),
          isA<RemoveFavoritesSelectionChanged>(),
        ],
        verify: (RemoveFavoritesBloc bloc) => expect(bloc.state.selections.isEmpty, true),
      );

      streamBlocTest<RemoveFavoritesBloc, RemoveFavoritesState>(
        '$RemoveFavoritesHided',
        build: () => RemoveFavoritesBloc(removeFavsRepository),
        act: (RemoveFavoritesBloc bloc) => bloc.add(const RemoveFavoritesHided()),
        expect: () => <TypeMatcher<RemoveFavoritesState>>[isA<RemoveFavoritesSelectionChanged>()],
        verify: (RemoveFavoritesBloc bloc) => expect(bloc.state.selections, const <int>{0}),
      );
    });
