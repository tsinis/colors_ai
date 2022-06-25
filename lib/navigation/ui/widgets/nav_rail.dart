import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/theme/constants.dart';
import '../../../color_generator/ui/widgets/buttons/generate_colors_fab.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/ui/constants.dart';
import '../../../favorites/blocs/list_favorites/favorites_bloc.dart';
import '../../../favorites/ui/widgets/buttons/save_colors_fab.dart';
import '../../blocs/navigation_bloc.dart';
import '../../mixins/nav_tab_indexer.dart';

class NavRail extends StatefulWidget {
  final Duration duration;
  final NavigationState navState;
  final bool toShowGenFab;

  const NavRail(
    this.navState, {
    required this.toShowGenFab,
    this.duration = kDefaultTransitionDuration,
    super.key,
  });

  @override
  State<NavRail> createState() => _NavRailState();
}

class _NavRailState extends State<NavRail> with NavTabIndexer {
  late bool isExtended;

  @override
  void didChangeDependencies() {
    isExtended = context.media.size.width >= 1366;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          if (context.media.size.width > 840 || isExtended) {
            setState(() => isExtended = !isExtended);
          }
        },
        child: BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (_, FavoritesState saveState) {
            final bool isFavoritesEmpty = saveState is FavoritesEmptyInitial;
            final List<String> tabLabels = tabNames(context.l10n);

            return NavigationRail(
              selectedIndex: widget.navState.index,
              onDestinationSelected: (int newTabIndex) {
                if (!(isFavoritesEmpty && newTabIndex == favoritesTabIndex)) {
                  BlocProvider.of<NavigationBloc>(context).add(NavigationEvent.changed(newTabIndex));
                }
              },
              extended: isExtended,
              leading: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SaveColorsFAB(isExtended: isExtended),
                  AnimatedCrossFade(
                    firstChild: const SizedBox.shrink(),
                    secondChild: GenerateColorsFAB(isExtended: isExtended),
                    crossFadeState: widget.toShowGenFab ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                    duration: widget.duration,
                  ),
                ],
              ),
              destinations: <NavigationRailDestination>[
                NavigationRailDestination(
                  label: Text(tabLabels[shareTabIndex]),
                  selectedIcon: const Icon(Icons.share),
                  icon: const Icon(Icons.share_outlined),
                ),
                NavigationRailDestination(
                  label: Text(tabLabels[colorsGenTabIndex]),
                  icon: const Icon(Icons.palette_outlined),
                  selectedIcon: const Icon(Icons.palette),
                ),
                NavigationRailDestination(
                  label: Text(
                    isFavoritesEmpty ? context.l10n.noFavoritesTabLabel : context.l10n.favoritesTabLabel,
                  ),
                  selectedIcon: const Icon(Icons.bookmarks),
                  icon: Icon(
                    Icons.bookmarks_outlined,
                    color: isFavoritesEmpty
                        ? context.theme.disabledColor
                        : context.theme.bottomNavigationBarTheme.selectedItemColor,
                  ),
                ),
              ],
            );
          },
        ),
      );
}
