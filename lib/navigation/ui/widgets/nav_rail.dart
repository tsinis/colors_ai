import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../app/theme/constants.dart';
import '../../../color_generator/ui/widgets/buttons/generate_colors_fab.dart';
import '../../../core/ui/constants.dart';
import '../../../favorites/blocs/list_favorites/favorites_bloc.dart';
import '../../../favorites/ui/widgets/buttons/save_colors_fab.dart';
import '../../blocs/navigation/navigation_bloc.dart';

class NavRail extends StatefulWidget {
  final Duration duration;
  final NavigationState navState;
  final bool toShowGenFab;

  const NavRail(this.navState, {required this.toShowGenFab, this.duration = kDefaultTransitionDuration});

  @override
  State<NavRail> createState() => _NavRailState();
}

class _NavRailState extends State<NavRail> {
  late bool isExtended;

  int get _colorsGenTabIndex => const NavigationGenerateTabInitial().tabIndex;
  int get _favoritesTabIndex => const NavigationFavoritesTabInitial().tabIndex;
  int get _shareTabIndex => const NavigationShareTabInitial().tabIndex;

  @override
  void didChangeDependencies() {
    isExtended = MediaQuery.of(context).size.width >= 1366;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          if (MediaQuery.of(context).size.width > 840 || isExtended) {
            setState(() => isExtended = !isExtended);
          }
        },
        child: BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (_, saveState) {
            final bool isFavoritesEmpty = saveState is FavoritesEmptyInitial;
            final List<String> tabLabels = tabNames(AppLocalizations.of(context));

            return NavigationRail(
              selectedIndex: widget.navState.tabIndex,
              onDestinationSelected: (int newTabIndex) {
                if (!(isFavoritesEmpty && newTabIndex == _favoritesTabIndex)) {
                  BlocProvider.of<NavigationBloc>(context).add(NavigationTabChanged(newTabIndex));
                }
              },
              extended: isExtended,
              leading: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SaveColorsFAB(isExtended: isExtended),
                  AnimatedCrossFade(
                    firstChild: const SizedBox.shrink(),
                    secondChild: GenerateColorsFAB(isExtended: isExtended),
                    crossFadeState: widget.toShowGenFab ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                    duration: widget.duration,
                  ),
                ],
              ),
              destinations: [
                NavigationRailDestination(
                  label: Text(tabLabels[_shareTabIndex]),
                  selectedIcon: const Icon(Icons.share),
                  icon: const Icon(Icons.share_outlined),
                ),
                NavigationRailDestination(
                  label: Text(tabLabels[_colorsGenTabIndex]),
                  icon: const Icon(Icons.palette_outlined),
                  selectedIcon: const Icon(Icons.palette),
                ),
                NavigationRailDestination(
                  label: Text(
                    isFavoritesEmpty
                        ? AppLocalizations.of(context).noFavoritesTabLabel
                        : AppLocalizations.of(context).favoritesTabLabel,
                  ),
                  selectedIcon: const Icon(Icons.bookmarks),
                  icon: Icon(
                    Icons.bookmarks_outlined,
                    color: isFavoritesEmpty
                        ? Theme.of(context).disabledColor
                        : Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
                  ),
                ),
              ],
            );
          },
        ),
      );
}
