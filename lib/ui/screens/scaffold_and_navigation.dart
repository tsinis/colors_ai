import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/colors_generated/colors_bloc.dart';
import '../../blocs/colors_generated/colors_event.dart';
import '../../blocs/colors_locked/locked_bloc.dart';
import '../../blocs/colors_locked/locked_event.dart';
import '../../blocs/colors_share/share_bloc.dart';
import '../../blocs/favorite_colors/favorites_bloc.dart';
import '../../blocs/favorite_colors/favorites_state.dart';
import '../../blocs/floating_action_button/fab_bloc.dart';
import '../../blocs/floating_action_button/fab_event.dart';
import '../../blocs/navigation/navigation_bloc.dart';
import '../../blocs/sounds_audio/sound_bloc.dart';
import '../../repositories/colors_repository.dart';
import '../../repositories/share_repository.dart';
import '../widgets/buttons/app_bar_buttons/about_button.dart';
import '../widgets/buttons/save_colors_fab.dart';
import 'constants.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen();

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final SoundBloc _soundBloc = SoundBloc();

  @override
  void initState() {
    _soundBloc.add(const SoundStarted());
    super.initState();
  }
  // static const FavoritesRepository _favoritesRepository = FavoritesRepository();

  int get _shareTabIndex => const NavigationShareTabInitial().tabIndex;
  int get _colorsGenTabIndex => const NavigationGenerateTabInitial().tabIndex;
  int get _favoritesTabIndex => const NavigationFavoritesTabInitial().tabIndex;

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => _soundBloc),
          // We need access to those 2 in app bar.
          BlocProvider<FavoritesBloc>(create: (_) => FavoritesBloc()),
          BlocProvider<LockedBloc>(
              create: (_) => LockedBloc(context.read<ColorsRepository>())..add(const LockStarted())),
        ],
        child: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            if (state.tabIndex != _colorsGenTabIndex) {
              BlocProvider.of<FabBloc>(context).add(const FabHided());
            }
            return Scaffold(
              floatingActionButton: const SaveColorsFAB(),
              appBar: AppBar(
                  title: Text(state.currentTabName, style: const TextStyle(fontWeight: FontWeight.w400)),
                  actions: [appBarActions[state.tabIndex], const AboutButton()]),
              body: MultiBlocProvider(providers: [
                BlocProvider<ColorsBloc>(
                    create: (_) => ColorsBloc(context.read<ColorsRepository>())..add(const ColorsGenerated())),
                BlocProvider<ShareBloc>(create: (_) => ShareBloc(const ShareRepository())),
              ], child: SafeArea(child: navTabs.elementAt(state.tabIndex))),
              bottomNavigationBar: BlocBuilder<FavoritesBloc, FavoritesState>(
                builder: (context, saveState) {
                  final bool isFavoritesEmpty = saveState is FavoritesEmptyInitial;
                  return BottomNavigationBar(
                    currentIndex: state.tabIndex,
                    onTap: (int newTabIndex) {
                      if (!(isFavoritesEmpty && newTabIndex == _favoritesTabIndex)) {
                        BlocProvider.of<NavigationBloc>(context).add(NavigationTabChanged(newTabIndex));
                      }
                    },
                    items: [
                      BottomNavigationBarItem(
                        label: state.tabLabels[_shareTabIndex],
                        activeIcon: const Icon(Icons.share),
                        icon: const Icon(Icons.share_outlined),
                      ),
                      BottomNavigationBarItem(
                          label: state.tabLabels[_colorsGenTabIndex],
                          icon: const Icon(Icons.palette_outlined),
                          activeIcon: const Icon(Icons.palette)),
                      BottomNavigationBarItem(
                        tooltip: isFavoritesEmpty ? 'No ${state.tabLabels.last}' : state.tabLabels.last,
                        label: state.tabLabels[_favoritesTabIndex],
                        activeIcon: const Icon(Icons.bookmarks),
                        icon: Icon(Icons.bookmarks_outlined,
                            color: isFavoritesEmpty
                                ? Theme.of(context).disabledColor
                                : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor),
                      ),
                    ],
                  );
                },
              ),
            );
          },
        ),
      );
}
