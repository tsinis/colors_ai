import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/about_dialog/about_bloc.dart';
import '../../blocs/colorpicker_dialog/colorpicker_bloc.dart';
import '../../blocs/colors_generated/colors_bloc.dart';
import '../../blocs/colors_locked/locked_bloc.dart';
import '../../blocs/colors_share/share_hydrated_bloc.dart';
import '../../blocs/favorite_colors/favorites_bloc.dart';
import '../../blocs/favorite_colors/favorites_state.dart';
import '../../blocs/floating_action_button/fab_bloc.dart';
import '../../blocs/floating_action_button/fab_event.dart';
import '../../blocs/navigation/navigation_bloc.dart';
import '../../blocs/snackbars/snackbars_bloc.dart';
import '../../blocs/sounds_vibration/sound_bloc.dart';
import '../../repositories/colors_repository.dart';
import '../widgets/buttons/app_bar_buttons/about_button.dart';
import '../widgets/buttons/save_colors_fab.dart';
import 'constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen();

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<MainScreen> {
  final SoundBloc _soundBloc = SoundBloc();

  @override
  void initState() {
    _soundBloc.add(const SoundStarted());
    super.initState();
  }

  int get _shareTabIndex => const NavigationShareTabInitial().tabIndex;
  int get _colorsGenTabIndex => const NavigationGenerateTabInitial().tabIndex;
  int get _favoritesTabIndex => const NavigationFavoritesTabInitial().tabIndex;

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<SoundBloc>(create: (_) => _soundBloc),
          BlocProvider<LockedBloc>(
              create: (_) => LockedBloc(context.read<ColorsRepository>())..add(const LockStarted())),
        ],
        child: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (_, navState) {
            if (navState.tabIndex != _colorsGenTabIndex) {
              BlocProvider.of<FabBloc>(context).add(const FabHided());
            }
            return Scaffold(
              floatingActionButton: const SaveColorsFAB(),
              appBar: AppBar(
                  title: Text(navState.currentTabName, style: const TextStyle(fontWeight: FontWeight.w400)),
                  actions: [
                    appBarActions[navState.tabIndex],
                    BlocProvider(create: (context) => AboutBloc(), child: const AboutButton())
                  ]),
              body: MultiBlocProvider(
                providers: [
                  BlocProvider<ColorsBloc>(
                      create: (_) => ColorsBloc(context.read<ColorsRepository>())..add(const ColorsStarted())),
                  BlocProvider<ShareBloc>(create: (_) => ShareBloc()..add(const ShareStarted())),
                  BlocProvider<ColorPickerBLoc>(create: (_) => ColorPickerBLoc()),
                  BlocProvider<SnackbarBloc>(create: (_) => SnackbarBloc()..add(const ServerStatusCheckedSuccess())),
                ],
                child: BlocListener<SnackbarBloc, SnackbarState>(
                  listener: (context, snackbarState) {
                    BlocProvider.of<SoundBloc>(context).add(const SoundCopied());
                    if (snackbarState is! SnackbarsInitial) {
                      late String message;
                      if (snackbarState is UrlCopySuccess) {
                        message = 'Link copied!';
                      } else if (snackbarState is ColorCopySuccess) {
                        message = 'Color ${snackbarState.clipboard} copied!';
                      } else if (snackbarState is ServerStatusCheckSuccess) {
                        message = 'The server is updated at midnight PDT, so it may be unavailable for 30 sec.';
                      }
                      final bool isUrlCopied = snackbarState is UrlCopySuccess;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 2),
                          content: Text(message),
                          behavior: isUrlCopied ? SnackBarBehavior.fixed : SnackBarBehavior.floating,
                          action: isUrlCopied
                              ? SnackBarAction(
                                  textColor: Colors.grey[400],
                                  label: 'OPEN',
                                  onPressed: () => BlocProvider.of<SnackbarBloc>(context).add(const UrlOpenedSuccess()))
                              : null,
                        ),
                      );
                    } else if (snackbarState is ServerStatusCheckSuccess) {}
                  },
                  child: SafeArea(child: navTabs.elementAt(navState.tabIndex)),
                ),
              ),
              bottomNavigationBar: BlocBuilder<FavoritesBloc, FavoritesState>(
                builder: (_, saveState) {
                  final bool isFavoritesEmpty = saveState is FavoritesEmptyInitial;
                  return NavigationBar(
                    backgroundColor: Colors.grey,
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
              ),
            );
          },
        ),
      );
}
