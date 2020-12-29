import 'dart:math' as math;

import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar(this.tabController);
  final TabController tabController;
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> with TickerProviderStateMixin {
  late AnimationController actionsController, leadingController;

  @override
  void initState() {
    super.initState();
    widget.tabController.addListener(handleTabSelection);
    actionsController = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    leadingController = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
  }

  @override
  void dispose() {
    actionsController.dispose();
    leadingController.dispose();
    super.dispose();
  }

  void handleTabSelection() {
    if (widget.tabController.indexIsChanging) {
      widget.tabController.index == 0 ? leadingController.reverse() : leadingController.forward();
    }
  }

  @override
  Widget build(BuildContext context) => AppBar(
        centerTitle: true,
        title: const Text('Colors AI', style: TextStyle(fontWeight: FontWeight.w300)),
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Transform.rotate(
            angle: -math.pi,
            child: AnimatedIcon(
                icon: AnimatedIcons.list_view, color: Colors.black12, size: 26, progress: leadingController),
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
          controller: widget.tabController,
          tabs: const [Tab(text: 'COLOR'), Tab(text: 'SAVED')],
        ),
      );
}
