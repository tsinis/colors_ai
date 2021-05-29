import 'dart:async';
import 'dart:ui';

import 'package:async/async.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../color_picker/ui/view/colorpicker_dialog.dart';
import '../../../../favorites/blocs/add_favorites/fab_bloc.dart';
import '../../../../general/extensions/color.dart';
import '../../../../general/models/color_palette/color_palette.dart';
import '../../../../general/ui/widgets/lists/default_grey_colors_list.dart';
import '../../../../oboarding/ui/view/onboarding_overlay.dart';
import '../../../../sound/blocs/sounds_vibration/sound_bloc.dart';
import '../../../blocs/colors_generated/colors_bloc.dart';
import '../../../blocs/colors_locked/locked_bloc.dart';
import '../animated/animated_list_tile.dart';
import '../buttons/lock_color_button.dart';
import '../helpers/drag_listner.dart';

class ColorsList extends StatefulWidget {
  const ColorsList(this.palette);
  final ColorPalette palette;

  @override
  _ColorsListState createState() => _ColorsListState();
}

class _ColorsListState extends State<ColorsList> with SingleTickerProviderStateMixin {
  late Completer<void> refreshCompleter;
  late CancelableOperation cancelableOperation;
  late final AnimationController controller;
  late final Animation<double> animation, reverseAnimation;

  List<Color> get palette => widget.palette.colors;

  void cancelOperation() => cancelableOperation.cancel();

  void setOperation() {
    bool toHideFab = true;
    cancelableOperation = CancelableOperation<void>.fromFuture(
      Future.delayed(kLongPressTimeout, () {
        if (toHideFab) {
          BlocProvider.of<FabBloc>(context).add(const FabHided());
        }
      }),
      onCancel: () {
        BlocProvider.of<FabBloc>(context).add(const FabShowed());
        toHideFab = false;
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (_, size) {
          final int length = palette.length;
          final double tileHeight = (size.maxHeight + 1) / length;
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
                  child:
                      DefaultGreyList(length: length, tileWidth: size.maxWidth, tileHeight: tileHeight - (1 / length))),
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
                  child: FadeTransition(
                    opacity: animation,
                    child: ReorderableListView(
                      buildDefaultDragHandles: false,
                      dragStartBehavior: DragStartBehavior.down,
                      physics: const AlwaysScrollableScrollPhysics(),
                      onReorder: (int oldIndex, int newIndex) => BlocProvider.of<ColorsBloc>(context)
                          .add(ColorsReordered(oldIndex: oldIndex, newIndex: newIndex)),
                      children: List.generate(length, (int index) {
                        final Color color = palette[index], contrastColor = color.contrastColor();
                        return AnimatedListItem(
                          index: index,
                          height: tileHeight,
                          key: ValueKey<int>(index),
                          length: length,
                          child: ReorderableDragListener(
                            index: index,
                            onDragStarted: setOperation,
                            onDragEnded: cancelOperation,
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
                          ),
                        );
                      }, growable: false),
                    ),
                  ),
                ),
              ),
              OnboardingOverlay(tileWidth: size.maxWidth, tileHeight: tileHeight - (1 / length)),
            ],
          );
        },
      );
}
