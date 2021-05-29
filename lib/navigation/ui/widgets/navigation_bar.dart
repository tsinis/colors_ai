import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../favorites/blocs/list_favorites/favorites_bloc.dart';
import '../../blocs/navigation/navigation_bloc.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar(this.navState);
  final NavigationState navState;

  int get _shareTabIndex => const NavigationShareTabInitial().tabIndex;
  int get _colorsGenTabIndex => const NavigationGenerateTabInitial().tabIndex;
  int get _favoritesTabIndex => const NavigationFavoritesTabInitial().tabIndex;

  @override
  Widget build(BuildContext context) => BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (_, saveState) {
          final bool isFavoritesEmpty = saveState is FavoritesEmptyInitial;
          return NavigationBar(
            backgroundColor: Theme.of(context).primaryColor,
            labelBehavior: NavigationBarDestinationLabelBehavior.alwaysHide,
            selectedIndex: navState.tabIndex,
            onTap: (int newTabIndex) {
              if (!(isFavoritesEmpty && newTabIndex == _favoritesTabIndex)) {
                BlocProvider.of<NavigationBloc>(context).add(NavigationTabChanged(newTabIndex));
              }
            },
            destinations: [
              NavigationBarDestination(
                  label: navState.tabLabels[_shareTabIndex],
                  icon: const Icon(Icons.share),
                  unselectedIcon: const Icon(Icons.share_outlined)),
              NavigationBarDestination(
                  label: navState.tabLabels[_colorsGenTabIndex],
                  unselectedIcon: const Icon(Icons.palette_outlined),
                  icon: const Icon(Icons.palette)),
              NavigationBarDestination(
                label: isFavoritesEmpty ? 'No ${navState.tabLabels.last}' : navState.tabLabels.last,
                icon: const Icon(Icons.bookmarks),
                unselectedIcon: Icon(Icons.bookmarks_outlined,
                    color: isFavoritesEmpty
                        ? Theme.of(context).disabledColor
                        : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor),
              ),
            ],
          );
        },
      );
}
