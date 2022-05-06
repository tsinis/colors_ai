import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/theme/constants.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/repository/colors_repository.dart';
import '../../blocs/list_favorites/favorites_bloc.dart';
import '../widgets/animated/no_favorites.dart';
import '../widgets/lists/favorites_list_adaptive.dart';
import '../widgets/lists/favorites_list_swipeable.dart';

class FavoritesTab extends StatelessWidget {
  const FavoritesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (_, FavoritesState state) => AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          switchInCurve: Curves.easeInQuart,
          switchOutCurve: Curves.easeOutQuart,
          layoutBuilder: (Widget? currentChild, List<Widget> previousChildren) => Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[...previousChildren, if (currentChild != null) currentChild],
          ),
          child: (state is FavoritesEmptyInitial)
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const Flexible(
                        child: FractionallySizedBox(
                          widthFactor: 0.6,
                          heightFactor: 0.7,
                          child: NoFavorites(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text.rich(
                          TextSpan(
                            text: context.l10n.noFavoritesTitle,
                            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                text: '\n${context.l10n.noFavoritesDescription}',
                                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal, height: 3),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 56, bottom: 24),
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.add, size: 20),
                          label: Text(context.l10n.addFavoritesButtonLabel),
                          onPressed: () => BlocProvider.of<FavoritesBloc>(context)
                              .add(FavoritesAdded(favorite: context.read<ColorsRepository>().palette.colors)),
                        ),
                      ),
                    ],
                  ),
                )
              : AnimatedSwitcher(
                  switchInCurve: Curves.decelerate,
                  switchOutCurve: Curves.decelerate,
                  duration: kDefaultTransitionDuration,
                  child: context.media.orientation == Orientation.portrait
                      ? const FavoritesListSwipeable()
                      : const FavoritesListAdaptive(),
                ),
        ),
      );
}
