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
        builder: (BuildContext context, state) {
          if (state is FavoritesEmptyInitial) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Flexible(
                      child: FractionallySizedBox(widthFactor: 0.5, heightFactor: 0.6, child: NoFavorites())),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: 'OOPS!',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: '\nFavorite colors list is empty.',
                            style:
                                TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black, height: 2),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.add, size: 20),
                      label: const Text('ADD SOME'),
                      autofocus: true,
                      onPressed: () => BlocProvider.of<FavoritesBloc>(context)
                          .add(FavoritesAdded(colorsToSave: context.read<ColorsRepository>().listAsColors)),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is FavoritesLoadSuccess) {
            return FavoritesList(state.favoriteColors.list);
          }
          return Container(color: Colors.blue);
        },
      );
}
