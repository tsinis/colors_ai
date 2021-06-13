import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../favorites/blocs/list_favorites/favorites_bloc.dart';
import '../../../general/ui/constants.dart';
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
          final List<String> tabLabels = tabNames(AppLocalizations.of(context));
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
                  label: tabLabels[_shareTabIndex],
                  icon: const Icon(Icons.share),
                  unselectedIcon: const Icon(Icons.share_outlined)),
              NavigationBarDestination(
                  label: tabLabels[_colorsGenTabIndex],
                  unselectedIcon: const Icon(Icons.palette_outlined),
                  icon: const Icon(Icons.palette)),
              NavigationBarDestination(
                label: isFavoritesEmpty
                    ? AppLocalizations.of(context).noFavoritesTabLabel
                    : AppLocalizations.of(context).favoritesTabLabel,
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
