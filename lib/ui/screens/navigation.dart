import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/colors_generated/colors_bloc.dart';
import '../../blocs/colors_locked/locked_bloc.dart';
import '../../blocs/colors_saved/saved_bloc.dart';
import '../../blocs/fab_bloc/fab_bloc.dart';
import '../../repositories/colors_repository.dart';
import '../widgets/buttons/save_colors_fab.dart';
import 'gen_colors_tab.dart';
import 'saved_colors_tab.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen();
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> with TickerProviderStateMixin {
  late final TabController tabController;
  late final AnimationController fabController, leadingController;
  late Animation<double> fabAnimation;

  List<Widget> get screens => <Widget>[
        BlocProvider<LockedBloc>(
            create: (_) => LockedBloc(context.read<ColorsRepository>()),
            child: const ColorsGenerator(appBarHeight: _appBarHeight)),
        SavedColorsList(returnToFirstTab),
      ];

  static const double _appBarHeight = 86;

  void returnToFirstTab() => tabController.animateTo(0, curve: Curves.fastLinearToSlowEaseIn);

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: screens.length)..addListener(handleTabSelection);
    fabController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    leadingController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    fabAnimation = CurvedAnimation(parent: fabController, curve: Curves.easeIn);
    fabController.forward();
  }

  @override
  void dispose() {
    tabController.dispose();
    fabController.dispose();
    leadingController.dispose();
    super.dispose();
  }

  void handleTabSelection() => (tabController.index == 0) ? leadingController.reverse() : leadingController.forward();

  bool handleScrollNotification(ScrollNotification notification) {
    final ScrollMetrics metrics = notification.metrics;
    if (metrics.axisDirection == AxisDirection.down || metrics.axisDirection == AxisDirection.up) {
      return false;
    } else {
      final double scrollPosition = ((metrics.extentInside - metrics.extentAfter) / metrics.extentInside).clamp(0, 1);
      if (scrollPosition == 0) {
        fabController.forward();
      } else if (scrollPosition == 1) {
        fabController.reverse();
      } else if (scrollPosition < 0.5 && scrollPosition > 0.2) {
        fabController.forward();
        leadingController.reverse();
      } else if (scrollPosition > 0.5 && scrollPosition < 0.8) {
        fabController.reverse();
        leadingController.forward();
      }
      return true;
    }
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<FabBloc>(create: (_) => FabBloc()), //TODO? Merge them maybe?
          BlocProvider<SavedBloc>(create: (_) => SavedBloc()),
        ],
        child: Scaffold(
          backgroundColor: Colors.grey[700], //TODO Provide bg color in theme.
          floatingActionButton: ScaleTransition(scale: fabAnimation, child: SaveColorsFAB(controller: fabController)),
          body: NotificationListener(
            onNotification: handleScrollNotification,
            child: BlocProvider<ColorsBloc>(
              create: (_) => ColorsBloc(context.read<ColorsRepository>()),
              child: TabBarView(
                  physics: const ClampingScrollPhysics(),
                  // dragStartBehavior: DragStartBehavior.down,
                  controller: tabController,
                  children: screens),
            ),
          ),
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
                child: AnimatedIcon(icon: AnimatedIcons.menu_close, size: 26, progress: fabController),
              ),
            ],
            bottom: TabBar(
              controller: tabController,
              tabs: const [Tab(text: 'COLOR'), Tab(text: 'SAVED')],
            ),
          ),
        ),
      );
}
