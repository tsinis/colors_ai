import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/ui/constants.dart';
import '../../../favorites/blocs/list_favorites/favorites_bloc.dart';
import '../../blocs/navigation_bloc.dart';
import '../../mixins/nav_tab_indexer.dart';

class BottomNavBar extends StatelessWidget with NavTabIndexer {
  final NavigationDestinationLabelBehavior labelBehavior;
  final NavigationState navState;

  const BottomNavBar(
    this.navState, {
    this.labelBehavior = NavigationDestinationLabelBehavior.alwaysHide,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (_, FavoritesState saveState) {
          final bool isFavoritesEmpty = saveState is FavoritesEmptyInitial;
          final List<String> tabLabels = tabNames(context.l10n);

          return NavigationBar(
            backgroundColor: context.theme.primaryColor,
            labelBehavior: labelBehavior,
            selectedIndex: navState.tabIndex,
            onDestinationSelected: (int newTabIndex) {
              if (!(isFavoritesEmpty && newTabIndex == favoritesTabIndex)) {
                BlocProvider.of<NavigationBloc>(context).add(NavigationTabChanged(newTabIndex));
              }
            },
            destinations: <NavigationDestination>[
              NavigationDestination(
                label: tabLabels[shareTabIndex],
                selectedIcon: const Icon(Icons.share),
                icon: Icon(Icons.share_outlined, color: context.theme.primaryIconTheme.color),
              ),
              NavigationDestination(
                label: tabLabels[colorsGenTabIndex],
                icon: Icon(Icons.palette_outlined, color: context.theme.primaryIconTheme.color),
                selectedIcon: const Icon(Icons.palette),
              ),
              NavigationDestination(
                label: isFavoritesEmpty ? context.l10n.noFavoritesTabLabel : context.l10n.favoritesTabLabel,
                selectedIcon: const Icon(Icons.bookmarks),
                icon: Icon(
                  Icons.bookmarks_outlined,
                  color: isFavoritesEmpty ? context.theme.disabledColor : context.theme.primaryIconTheme.color,
                ),
              ),
            ],
          );
        },
      );
}
