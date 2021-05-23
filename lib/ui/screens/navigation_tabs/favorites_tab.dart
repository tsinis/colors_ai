import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/favorite_colors/favorites_bloc.dart';
import '../../../blocs/favorite_colors/favorites_event.dart';
import '../../../blocs/favorite_colors/favorites_state.dart';
import '../../../repositories/colors_repository.dart';
import '../../widgets/animated/no_favorites.dart';
import '../../widgets/lists/favorites_list.dart';

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
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              text: 'OOPS!',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '\nFavorite Colors list is empty now.',
                                  style: TextStyle(
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
                            label: const Text('ADD SOME'),
                            autofocus: true,
                            onPressed: () => BlocProvider.of<FavoritesBloc>(context)
                                .add(FavoritesAdded(favorite: context.read<ColorsRepository>().asPalette)),
                          ),
                        ),
                      ],
                    ),
                  )
                : (state is FavoritesLoadSuccess)
                    ? FavoritesList(state.favoriteColors.list)
                    : const Center(child: CircularProgressIndicator()),
          ));
}
