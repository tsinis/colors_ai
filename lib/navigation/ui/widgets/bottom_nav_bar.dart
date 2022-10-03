import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/ui/constants.dart';
import '../../../favorites/blocs/list_favorites/favorites_bloc.dart';
import '../../blocs/navigation_bloc.dart';
import '../../mixins/nav_tab_indexer.dart';
import 'constants.dart';

class BottomNavBar extends StatelessWidget with NavTabIndexer {
  final NavigationDestinationLabelBehavior labelBehavior;
  final NavigationState navState;

  const BottomNavBar(
    this.navState, {
    this.labelBehavior = NavigationDestinationLabelBehavior.alwaysHide,
    super.key,
  });

  @override
  Widget build(BuildContext context) => BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (_, FavoritesState saveState) {
          final bool isFavoritesEmpty = saveState is FavoritesEmptyInitial;
          final List<String> tabLabels = tabNames(context.l10n);

          return NavigationBar(
            backgroundColor: context.theme.primaryColor,
            labelBehavior: labelBehavior,
            selectedIndex: navState.index,
            onDestinationSelected: (int newTabIndex) {
              if (!(isFavoritesEmpty && newTabIndex == favoritesTabIndex)) {
                BlocProvider.of<NavigationBloc>(context).add(NavigationEvent.changed(newTabIndex));
              }
            },
            destinations: <NavigationDestination>[
              NavigationDestination(
                key: kShareSelectedIcon.key,
                label: tabLabels[shareTabIndex],
                selectedIcon: Icon(kShareSelectedIcon.icon),
                icon: Icon(
                  kShareUnselectedIcon.icon,
                  color: context.theme.primaryIconTheme.color,
                ),
              ),
              NavigationDestination(
                key: kGenerateSelectedIcon.key,
                label: tabLabels[colorsGenTabIndex],
                icon: Icon(kGenerateUnselectedIcon.icon, color: context.theme.primaryIconTheme.color),
                selectedIcon: Icon(kGenerateSelectedIcon.icon),
              ),
              NavigationDestination(
                key: kFavoritesSelectedIcon.key,
                label: isFavoritesEmpty ? context.l10n.noFavoritesTabLabel : context.l10n.favoritesTabLabel,
                selectedIcon: Icon(kFavoritesSelectedIcon.icon),
                icon: Icon(
                  kFavoritesUnselectedIcon.icon,
                  color: isFavoritesEmpty ? context.theme.disabledColor : context.theme.primaryIconTheme.color,
                ),
              ),
            ],
          );
        },
      );
}
