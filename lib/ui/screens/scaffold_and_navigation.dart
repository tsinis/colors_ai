import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/colors_generated/colors_bloc.dart';
import '../../blocs/colors_locked/locked_bloc.dart';
import '../../blocs/colors_locked/locked_event.dart';
import '../../blocs/colors_saved/saved_bloc.dart';
import '../../blocs/colors_share/share_bloc.dart';
import '../../blocs/floating_action_button/fab_bloc.dart';
import '../../blocs/floating_action_button/fab_event.dart';
import '../../blocs/navigation/navigation_bloc.dart';
import '../../blocs/sounds_audio/sound_bloc.dart';
import '../../repositories/colors_repository.dart';
// import '../../repositories/saved_favorites_repository.dart';
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
  // static const SavedColorsRepository _savedRepository = SavedColorsRepository();

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => _soundBloc),
          // We need access to those 2 in app bar.
          BlocProvider<SavedBloc>(create: (_) => SavedBloc()),
          BlocProvider<LockedBloc>(
              create: (_) => LockedBloc(context.read<ColorsRepository>())..add(const LockShowed())),
        ],
        child: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            if (state.tabIndex != 1) {
              BlocProvider.of<FabBloc>(context).add(const FabHided());
            }
            return Scaffold(
              floatingActionButton: const SaveColorsFAB(),
              appBar: AppBar(
                  title: Text(state.currentTabName, style: const TextStyle(fontWeight: FontWeight.w400)),
                  actions: [appBarActions[state.tabIndex], const AboutButton()]),
              body: MultiBlocProvider(providers: [
                BlocProvider<ColorsBloc>(create: (_) => ColorsBloc(context.read<ColorsRepository>())),
                BlocProvider<ShareBloc>(create: (_) => ShareBloc()),
              ], child: SafeArea(child: navTabs.elementAt(state.tabIndex))),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: state.tabIndex,
                onTap: (int tabIndex) => BlocProvider.of<NavigationBloc>(context).add(NavigationTabChanged(tabIndex)),
                items: [
                  BottomNavigationBarItem(label: state.tabLabels.first, icon: const Icon(Icons.share_outlined)),
                  BottomNavigationBarItem(label: state.tabLabels[1], icon: const Icon(Icons.palette_outlined)),
                  //TODO Add "Saved" icon or animation.
                  BottomNavigationBarItem(
                      label: state.tabLabels.last, icon: const Icon(Icons.bookmark_border_outlined)),
                ],
              ),
            );
          },
        ),
      );
}
