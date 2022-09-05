import 'package:colors_ai/app/theme/constants.dart';
import 'package:colors_ai/core/extensions/context_extensions.dart';
import 'package:colors_ai/core/models/color_palette/color_palette.dart';
import 'package:colors_ai/favorites/blocs/list_favorites/favorites_bloc.dart';
import 'package:colors_ai/favorites/blocs/remove_favorites/remove_favorites_bloc.dart';
import 'package:colors_ai/favorites/repository/favorites_repository.dart';
import 'package:colors_ai/favorites/repository/remove_favorites_repository.dart';
import 'package:colors_ai/favorites/services/storage_providers/favorites_hive_storage.dart';
import 'package:colors_ai/favorites/ui/widgets/buttons/remove_all_favorites_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../data/helpers/utils.dart';

void main() => group('$RemoveAllFavoritesButton', () {
      late RemoveFavoritesRepository removeFavsRepository;
      late FavoritesRepository favoritesRepository;
      late FavoritesBloc favoritesBloc;
      late RemoveFavoritesBloc removeFavoritesBloc;

      setUpAll(createFakeStorageDir);

      setUp(
        () async {
          removeFavsRepository = RemoveFavoritesRepository(Set<int>.from(<int>{0}));
          favoritesRepository = FavoritesRepository(
            List<ColorPalette>.empty(growable: true),
            FavoritesHiveStorage(boxName: uniqueBoxName),
          );
          await favoritesRepository.storage.storedFavorites;
          favoritesBloc = FavoritesBloc(favoritesRepository);
          removeFavoritesBloc = RemoveFavoritesBloc(removeFavsRepository);
          favoritesBloc.add(const FavoritesStarted());
          await Future<void>.delayed(const Duration(milliseconds: 5));
          favoritesBloc.add(const FavoritesAdded(favorite: <Color>[Color.fromARGB(0, 0, 0, 0)]));
          await Future<void>.delayed(const Duration(milliseconds: 5));
        },
      );

      testWidgets(
        'tap on remove button',
        (WidgetTester tester) async => tester.runAsync(() async {
          await tester.pumpWidget(
            MultiBlocProvider(
              providers: <BlocProvider<BlocBase<Object>>>[
                BlocProvider<FavoritesBloc>(
                  create: (_) => favoritesBloc,
                  lazy: false,
                ),
                BlocProvider<RemoveFavoritesBloc>(
                  create: (_) => removeFavoritesBloc..add(const RemoveFavoritesSelected(0)),
                ),
              ],
              child: const MaterialApp(
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                home: Material(child: RemoveAllFavoritesButton()),
              ),
            ),
          );
          final Finder button = find.byType(RemoveAllFavoritesButton);
          await tester.ensureVisible(button);
          expect(button, findsOneWidget);

          expect(find.byType(AlertDialog), findsNothing);
          await tester.tap(button);
          await Future<void>.delayed(kDefaultTransitionDuration);
          await tester.pump();
          await Future<void>.delayed(kDefaultTransitionDuration);
          await tester.pump();
          expect(find.byType(AlertDialog), findsOneWidget);
          final Finder removeButton = find.byWidgetPredicate((Widget widget) {
            if (widget is TextButton && widget.child is Text) {
              final Text? text = widget.child as Text?;

              return text?.data == 'Remove';
            }

            return false;
          });
          await tester.ensureVisible(removeButton);
          await tester.pump();
          await tester.tap(removeButton);
        }),
      );

      testWidgets(
        'tap on cancel button',
        (WidgetTester tester) async => tester.runAsync(() async {
          await tester.pumpWidget(
            MultiBlocProvider(
              providers: <BlocProvider<BlocBase<Object>>>[
                BlocProvider<FavoritesBloc>(
                  create: (_) => favoritesBloc,
                  lazy: false,
                ),
                BlocProvider<RemoveFavoritesBloc>(
                  create: (_) => removeFavoritesBloc..add(const RemoveFavoritesSelected(0)),
                ),
              ],
              child: const MaterialApp(
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                home: Material(child: RemoveAllFavoritesButton()),
              ),
            ),
          );
          final Finder button = find.byType(RemoveAllFavoritesButton);
          await tester.ensureVisible(button);
          expect(button, findsOneWidget);

          expect(find.byType(AlertDialog), findsNothing);
          await tester.tap(button);
          await Future<void>.delayed(kDefaultTransitionDuration);
          await tester.pump();
          await Future<void>.delayed(kDefaultTransitionDuration);
          await tester.pump();
          expect(find.byType(AlertDialog), findsOneWidget);
          final Finder cancelButton = find.byWidgetPredicate((Widget widget) {
            if (widget is TextButton && widget.child is Text) {
              final Text? text = widget.child as Text?;

              return text?.data == 'Cancel';
            }

            return false;
          });
          await tester.ensureVisible(cancelButton);
          await tester.pump();
          await tester.tap(cancelButton);
        }),
      );

      tearDownAll(deleteFakeStorageDir);
    });
