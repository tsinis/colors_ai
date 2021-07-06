import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../general/repository/colors_repository.dart';
import '../../blocs/list_favorites/favorites_bloc.dart';
import '../widgets/animated/no_favorites.dart';
import '../widgets/lists/favorites_list_adaptive.dart';
import '../widgets/lists/favorites_list_swipeable.dart';

class FavoritesTab extends StatelessWidget {
  const FavoritesTab();

  @override
  Widget build(BuildContext context) => BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (_, state) => AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          switchInCurve: Curves.easeInQuart,
          switchOutCurve: Curves.easeOutQuart,
          child: (state is FavoritesEmptyInitial)
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Flexible(
                          child: FractionallySizedBox(widthFactor: 0.6, heightFactor: 0.7, child: NoFavorites())),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: RichText(
                          textScaleFactor: MediaQuery.of(context).textScaleFactor,
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: AppLocalizations.of(context).noFavoritesTitle.toUpperCase(),
                            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                            children: [
                              TextSpan(
                                text: '\n${AppLocalizations.of(context).noFavoritesDescription}',
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black, height: 3),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 56, bottom: 24),
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.add, size: 20),
                          label: Text(AppLocalizations.of(context).addFavoritesButtonLabel.toUpperCase()),
                          autofocus: true,
                          onPressed: () => BlocProvider.of<FavoritesBloc>(context)
                              .add(FavoritesAdded(favorite: context.read<ColorsRepository>().toPalette())),
                        ),
                      ),
                    ],
                  ),
                )
              : MediaQuery.of(context).orientation == Orientation.portrait
                  ? const FavoritesListSwipeable()
                  : const FavoritesListAdaptive(),
        ),
      );
}
