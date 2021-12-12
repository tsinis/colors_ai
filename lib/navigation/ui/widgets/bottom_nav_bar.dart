import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/ui/constants.dart';
import '../../../favorites/blocs/list_favorites/favorites_bloc.dart';
import '../../blocs/navigation/navigation_bloc.dart';

class BottomNavBar extends StatelessWidget {
  final NavigationDestinationLabelBehavior labelBehavior;
  final NavigationState navState;

  int get _colorsGenTabIndex => const NavigationGenerateTabInitial().tabIndex;
  int get _favoritesTabIndex => const NavigationFavoritesTabInitial().tabIndex;
  int get _shareTabIndex => const NavigationShareTabInitial().tabIndex;

  const BottomNavBar(
    this.navState, {
    this.labelBehavior = NavigationDestinationLabelBehavior.alwaysHide,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (_, FavoritesState saveState) {
          final bool isFavoritesEmpty = saveState is FavoritesEmptyInitial;
          final List<String> tabLabels = tabNames(AppLocalizations.of(context));

          return NavigationBar(
            backgroundColor: Theme.of(context).primaryColor,
            labelBehavior: labelBehavior,
            selectedIndex: navState.tabIndex,
            onDestinationSelected: (int newTabIndex) {
              if (!(isFavoritesEmpty && newTabIndex == _favoritesTabIndex)) {
                BlocProvider.of<NavigationBloc>(context).add(NavigationTabChanged(newTabIndex));
              }
            },
            destinations: <NavigationDestination>[
              NavigationDestination(
                label: tabLabels[_shareTabIndex],
                selectedIcon: const Icon(Icons.share),
                icon: Icon(Icons.share_outlined, color: Theme.of(context).primaryIconTheme.color),
              ),
              NavigationDestination(
                label: tabLabels[_colorsGenTabIndex],
                icon: Icon(Icons.palette_outlined, color: Theme.of(context).primaryIconTheme.color),
                selectedIcon: const Icon(Icons.palette),
              ),
              NavigationDestination(
                label: isFavoritesEmpty
                    ? AppLocalizations.of(context).noFavoritesTabLabel
                    : AppLocalizations.of(context).favoritesTabLabel,
                selectedIcon: const Icon(Icons.bookmarks),
                icon: Icon(
                  Icons.bookmarks_outlined,
                  color: isFavoritesEmpty ? Theme.of(context).disabledColor : Theme.of(context).primaryIconTheme.color,
                ),
              ),
            ],
          );
        },
      );
}
