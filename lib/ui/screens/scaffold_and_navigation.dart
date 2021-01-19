import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/colors_generated/colors_bloc.dart';
import '../../blocs/colors_locked/locked_bloc.dart';
import '../../blocs/colors_locked/locked_event.dart';
import '../../blocs/colors_saved/saved_bloc.dart';
import '../../blocs/floating_action_button/fab_bloc.dart';
import '../../blocs/floating_action_button/fab_event.dart';
import '../../repositories/colors_repository.dart';
import '../widgets/buttons/save_colors_fab.dart';
import 'constants.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen();

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentTabIndex = 1;

  void _switchScreen(int newTabIndex) {
    //TODO! FIXIT: Handle it in NavigationBloc.
    setState(() => _currentTabIndex = newTabIndex);
    BlocProvider.of<FabBloc>(context).add((_currentTabIndex == 1) ? const FabShowEvent() : const FabHideEvent());
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          // We need access to them in app bar.
          BlocProvider<SavedBloc>(create: (_) => SavedBloc()),
          BlocProvider<LockedBloc>(
              create: (_) => LockedBloc(context.read<ColorsRepository>())..add(const ShowLockEvent())),
        ],
        child: Scaffold(
          floatingActionButton: const SaveColorsFAB(),
          appBar: AppBar(
            title: Text(tabLabels[_currentTabIndex], style: const TextStyle(fontWeight: FontWeight.w400)),
            actions: [
              appBarActions[_currentTabIndex],
              IconButton(icon: const Icon(Icons.settings_outlined), onPressed: () {}),
            ],
          ),
          body: BlocProvider<ColorsBloc>(
              create: (_) => ColorsBloc(context.read<ColorsRepository>()),
              child: SafeArea(child: navTabs.elementAt(_currentTabIndex))),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentTabIndex,
            onTap: _switchScreen,
            items: [
              BottomNavigationBarItem(label: tabLabels.first, icon: const Icon(Icons.share_outlined)),
              BottomNavigationBarItem(label: tabLabels[1], icon: const Icon(Icons.palette_outlined)),
              BottomNavigationBarItem(label: tabLabels.last, icon: const Icon(Icons.bookmark_border_outlined)),
            ],
          ),
        ),
      );
}
