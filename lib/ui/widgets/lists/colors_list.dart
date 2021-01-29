import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/colors_generated/colors_bloc.dart';
import '../../../blocs/colors_generated/colors_event.dart';
import '../../../blocs/colors_generated/colors_state.dart';
import '../../../blocs/colors_locked/locked_bloc.dart';
import '../../../blocs/colors_locked/locked_event.dart';
import '../../../blocs/floating_action_button/fab_bloc.dart';
import '../../../blocs/floating_action_button/fab_event.dart';
import '../../../blocs/sounds_audio/sound_bloc.dart';
import '../../../extensions/list_int_to_color.dart';
import '../animated/animated_list_tile.dart';
import '../buttons/lock_color_button.dart';
import '../colorpicker.dart';
import '../customized_default_widgets/refrashable_reordable.dart';
import 'default_grey_colors_list.dart';
import 'onboarding_list.dart';

class ColorsList extends StatefulWidget {
  const ColorsList(this.colorsList);
  final List<List<int>> colorsList;
  @override
  _ColorsListState createState() => _ColorsListState();
}

class _ColorsListState extends State<ColorsList> with SingleTickerProviderStateMixin {
  late Completer<void> _refreshCompleter;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
    _controller = AnimationController(duration: const Duration(milliseconds: 700), vsync: this)
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.dismissed) {
            _controller.forward();
          }
        },
      );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn, reverseCurve: Curves.easeOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Size get size => MediaQuery.of(context).size;
  double get padding => MediaQueryData.fromWindow(window).padding.vertical;
  int get length => widget.colorsList.length;
  double get tileHeight => (size.height - kBottomNavigationBarHeight - kToolbarHeight - padding) / length;
  Size get third => Size(size.width / 3, tileHeight);

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          DefaultGreyList(length: length, tileWidth: size.width, tileHeight: tileHeight),
          BlocConsumer<ColorsBloc, ColorsState>(
            listener: (context, state) {
              _refreshCompleter.complete();
              _refreshCompleter = Completer();
            },
            builder: (context, state) => RefreshIndicator(
              onRefresh: () {
                _controller.reverse();
                BlocProvider.of<SoundBloc>(context).add(const SoundRefreshed());
                BlocProvider.of<ColorsBloc>(context).add(const ColorsGenerated());
                BlocProvider.of<FabBloc>(context).add(const FabShowed());
                return _refreshCompleter.future;
              },
              child: ScrollConfiguration(
                behavior: const NoGlowBehavior(),
                child: FadeTransition(
                  opacity: _animation,
                  child: RefreshableReorderableListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    onDragStart: () => BlocProvider.of<FabBloc>(context).add(const FabHided()),
                    onDragEnd: () => BlocProvider.of<FabBloc>(context).add(const FabShowed()),
                    onReorder: (int oldIndex, int newIndex) => BlocProvider.of<ColorsBloc>(context)
                        .add(ColorsReordered(oldIndex: oldIndex, newIndex: newIndex)),
                    children: List.generate(length, (int index) {
                      final Color color = widget.colorsList[index].toColor(),
                          contrastColor = widget.colorsList[index].contrastColor();
                      return AnimatedListItem(
                        index: index,
                        height: tileHeight,
                        key: ValueKey<int>(index),
                        length: length,
                        child: InkWell(
                          onDoubleTap: () {
                            BlocProvider.of<SoundBloc>(context).add(const SoundLocked());
                            BlocProvider.of<LockedBloc>(context).add(LockChanged(index));
                          },
                          child: Container(
                            width: size.width,
                            height: tileHeight,
                            color: color,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Colorpicker(index, color: color, textColor: contrastColor, buttonSize: third),
                                LockColorButton(index, color: contrastColor),
                                SizedBox.fromSize(size: third),
                              ],
                            ),
                          ),
                        ),
                      );
                    }, growable: false),
                  ),
                ),
              ),
            ),
          ),
          OnboardingList(tileWidth: size.width, tileHeight: tileHeight),
        ],
      );
}

class NoGlowBehavior extends ScrollBehavior {
  const NoGlowBehavior();
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) => child;
}
