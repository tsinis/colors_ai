import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/colors_generated/colors_bloc.dart';
import '../../../blocs/colors_locked/locked_bloc.dart';
import '../../../blocs/floating_action_button/fab_bloc.dart';
import '../../../blocs/floating_action_button/fab_event.dart';
import '../../../blocs/sounds_vibration/sound_bloc.dart';
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
  late Completer<void> refreshCompleter;
  late final AnimationController controller;
  late final Animation<double> animation, reverseAnimation;

  @override
  void initState() {
    super.initState();
    refreshCompleter = Completer<void>();
    controller = AnimationController(duration: const Duration(milliseconds: 600), lowerBound: 0.2, vsync: this)
      ..addStatusListener((animationStatus) {
        if (animationStatus == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInCubic, reverseCurve: Curves.easeInExpo);
    reverseAnimation = ReverseAnimation(animation);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (_, size) {
          final int length = widget.colorsList.length;
          final double tileHeight = size.maxHeight / length;
          final Size third = Size(size.maxWidth / 3, tileHeight);
          return Stack(
            children: [
              FadeTransition(
                opacity: animation,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                      padding: EdgeInsets.only(bottom: tileHeight / 3),
                      child: const Text('Pull down to refresh',
                          style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w300))),
                ),
              ),
              FadeTransition(
                  opacity: reverseAnimation,
                  child: DefaultGreyList(length: length, tileWidth: size.maxWidth, tileHeight: tileHeight)),
              BlocConsumer<ColorsBloc, ColorsState>(
                listener: (_, __) {
                  refreshCompleter.complete();
                  refreshCompleter = Completer();
                },
                builder: (_, __) => RefreshIndicator(
                  triggerMode: RefreshIndicatorTriggerMode.anywhere,
                  displacement: tileHeight,
                  onRefresh: () {
                    controller.reverse();
                    BlocProvider.of<SoundBloc>(context).add(const SoundRefreshed());
                    BlocProvider.of<ColorsBloc>(context).add(const ColorsGenerated());
                    BlocProvider.of<FabBloc>(context).add(const FabShowed());
                    return refreshCompleter.future;
                  },
                  child: ScrollConfiguration(
                    behavior: const NoGlowBehavior(),
                    child: FadeTransition(
                      opacity: animation,
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
                                width: size.maxWidth,
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
              OnboardingList(tileWidth: size.maxWidth, tileHeight: tileHeight),
            ],
          );
        },
      );
}

class NoGlowBehavior extends ScrollBehavior {
  const NoGlowBehavior();
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) => child;
}
