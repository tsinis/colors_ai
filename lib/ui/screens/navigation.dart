import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/colors_generated/colors_bloc.dart';
import '../../blocs/colors_locked/locked_bloc.dart';
import '../../blocs/colors_locked/locked_event.dart';
import '../../blocs/colors_saved/saved_bloc.dart';
import '../../blocs/colors_saved/saved_event.dart';
import '../../repositories/colors_repository.dart';
import 'gen_colors_tab.dart';
import 'saved_colors_tab.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen();
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> with TickerProviderStateMixin {
  late final TabController tabController;
  late final AnimationController actionsController, leadingController;
  static const ColorsRepository colorsRepository = ColorsRepository();

  late List<Widget> screens = <Widget>[
    BlocProvider<LockedBloc>(
        create: (_) => LockedBloc(colorsRepository)..add(UnLockEvent()),
        child: const ColorsGenerator(appBarHeight: _appBarHeight)),
    BlocProvider<SavedBloc>(
      create: (_) => SavedBloc()..add(SavedExistingEvent()),
      child: const SavedColors(),
    ),
  ];

  static const double _appBarHeight = 86;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: screens.length)..addListener(handleTabSelection);
    actionsController = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    leadingController = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
  }

  @override
  void dispose() {
    tabController.dispose();
    actionsController.dispose();
    leadingController.dispose();
    super.dispose();
  }

  void handleTabSelection() => tabController.index == 0 ? leadingController.reverse() : leadingController.forward();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocProvider<ColorsBloc>(
            create: (_) => ColorsBloc(colorsRepository),
            child: TabBarView(controller: tabController, children: screens)),
        appBar: AppBar(
          toolbarHeight: _appBarHeight,
          centerTitle: true,
          title: const Text('Colors AI', style: TextStyle(fontWeight: FontWeight.w300)),
          leading: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Transform.rotate(
              angle: -math.pi,
              child: AnimatedIcon(
                  //TODO Provide icon color in theme.
                  icon: AnimatedIcons.list_view,
                  color: Colors.black12,
                  size: 26,
                  progress: leadingController),
            ),
          ),
          actions: [
            IconButton(icon: const Icon(Icons.share), onPressed: () {}),
            Padding(
              padding: const EdgeInsets.only(right: 21, left: 7, top: 7),
              child: AnimatedIcon(icon: AnimatedIcons.menu_close, size: 26, progress: actionsController),
            ),
          ],
          bottom: TabBar(
            controller: tabController,
            tabs: const [Tab(text: 'COLOR'), Tab(text: 'SAVED')],
          ),
        ),
      );
}
