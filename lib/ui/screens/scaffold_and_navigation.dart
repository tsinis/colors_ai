import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/about_dialog/about_bloc.dart';
import '../../blocs/colorpicker_dialog/colorpicker_bloc.dart';
import '../../blocs/colors_generated/colors_bloc.dart';
import '../../blocs/colors_locked/locked_bloc.dart';
import '../../blocs/colors_share/share_bloc.dart';
import '../../blocs/favorite_colors/favorites_bloc.dart';
import '../../blocs/favorite_colors/favorites_state.dart';
import '../../blocs/floating_action_button/fab_bloc.dart';
import '../../blocs/floating_action_button/fab_event.dart';
import '../../blocs/navigation/navigation_bloc.dart';
import '../../blocs/sounds_audio/sound_bloc.dart';
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
          builder: (_, state) {
            if (state.tabIndex != _colorsGenTabIndex) {
              BlocProvider.of<FabBloc>(context).add(const FabHided());
            }
            return Scaffold(
              key: const ValueKey<bool>(false),
              floatingActionButton: const SaveColorsFAB(),
              appBar: AppBar(
                  title: Text(state.currentTabName, style: const TextStyle(fontWeight: FontWeight.w400)),
                  actions: [
                    appBarActions[state.tabIndex],
                    BlocProvider(
                        create: (context) => AboutBloc()..add(const AboutStarted()), child: const AboutButton())
                  ]),
              body: MultiBlocProvider(
                providers: [
                  BlocProvider<ColorsBloc>(
                      create: (_) => ColorsBloc(context.read<ColorsRepository>())..add(const ColorsStarted())),
                  BlocProvider<ShareBloc>(create: (_) => ShareBloc()..add(const ShareUrlProviderSelected())),
                  BlocProvider<ColorPickerBLoc>(create: (_) => ColorPickerBLoc()),
                ],
                child: MultiBlocListener(
                  listeners: [
                    BlocListener<ShareBloc, ShareState>(
                      listener: (context, shareState) {
                        if (shareState is ShareCopySuccess) {
                          BlocProvider.of<SoundBloc>(context).add(const SoundCopied());
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(duration: Duration(seconds: 1), content: Text('Link copied!')));
                        }
                      },
                    ),
                    BlocListener<ColorPickerBLoc, ColorPickerState>(
                      listener: (context, pickerState) {
                        if (pickerState is ColorPickerCopySuccess) {
                          BlocProvider.of<SoundBloc>(context).add(const SoundCopied());
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: const Duration(seconds: 1),
                            content: Text('Color ${pickerState.copiedColor} copied!'),
                            behavior: SnackBarBehavior.floating,
                          ));
                        }
                      },
                    ),
                  ],
                  child: SafeArea(child: navTabs.elementAt(state.tabIndex)),
                ),
              ),
              bottomNavigationBar: BlocBuilder<FavoritesBloc, FavoritesState>(
                builder: (_, saveState) {
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
