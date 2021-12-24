import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:platform_info/platform_info.dart';

import '../../../../color_picker/ui/view/colorpicker.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../core/models/color_palette/color_palette.dart';
import '../../../../core/ui/widgets/lists/default_grey_colors_list.dart';
import '../../../../favorites/blocs/add_favorites/fab_bloc.dart';
import '../../../../oboarding/blocs/onboarding/onboarding_bloc.dart';
import '../../../../oboarding/ui/view/onboarding_overlay.dart';
import '../../../../sound/blocs/sounds_vibration/sound_bloc.dart';
import '../../../blocs/colors_generated/colors_bloc.dart';
import '../../../blocs/colors_locked/lock_bloc.dart';
import '../animated/animated_list_tile.dart';
import '../buttons/lock_color_button.dart';
import '../helpers/reorderable_drag_listener.dart';

class ColorsList extends StatefulWidget {
  final Curve curve;
  final Duration? duration;
  final double lowerBound;
  final ColorPalette palette;
  final Curve? reverseCurve;

  const ColorsList(
    this.palette, {
    this.lowerBound = 0.2,
    this.curve = Curves.easeInCubic,
    this.reverseCurve = Curves.easeInExpo,
    this.duration = const Duration(milliseconds: 600),
    Key? key,
  }) : super(key: key);

  @override
  _ColorsListState createState() => _ColorsListState();
}

class _ColorsListState extends State<ColorsList> with SingleTickerProviderStateMixin {
  late final Animation<double> animation;
  late CancelableOperation<void> cancelableOperation;
  late final AnimationController controller;
  int? hoverIndex;
  late Completer<void> refreshCompleter;
  late final Animation<double> reverseAnimation;

  bool get isPortrait => MediaQuery.of(context).orientation == Orientation.portrait;

  List<Color> get palette => widget.palette.colors;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    refreshCompleter = Completer<void>();
    controller = AnimationController(duration: widget.duration, lowerBound: widget.lowerBound, vsync: this)
      ..addStatusListener((AnimationStatus animationStatus) {
        if (animationStatus == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    animation = CurvedAnimation(parent: controller, curve: widget.curve, reverseCurve: widget.reverseCurve);
    reverseAnimation = ReverseAnimation(animation);
    controller.forward();
  }

  void cancelOperation() => cancelableOperation.cancel();

  void changeHoverIndex([int? index]) => setState(() => hoverIndex = index);

  void setOperation() {
    bool toHideFab = true;
    cancelableOperation = CancelableOperation<void>.fromFuture(
      Future<void>.delayed(kLongPressTimeout, () {
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
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (_, BoxConstraints size) {
          final int length = palette.length;
          final double tileHeight = size.maxHeight / length;
          final Size third =
              isPortrait ? Size.fromWidth(size.maxWidth / 3) : Size(size.maxWidth / length, size.maxHeight / 3);

          return BlocListener<ColorsBloc, ColorsState>(
            listener: (_, ColorsState colorsState) {
              if (colorsState is ColorsLoadStarted) {
                controller.reverse();
              }
            },
            child: Stack(
              children: <Widget>[
                if (!kIsWeb && platform.isIOS)
                  FadeTransition(
                    opacity: animation,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: tileHeight / 3),
                        child: Text(
                          AppLocalizations.of(context).pullToRefreshTip,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ),
                FadeTransition(opacity: reverseAnimation, child: DefaultGreyColorsList(length: length)),
                BlocConsumer<ColorsBloc, ColorsState>(
                  listener: (_, __) {
                    refreshCompleter.complete();
                    refreshCompleter = Completer<void>();
                  },
                  builder: (_, __) => RefreshIndicator(
                    triggerMode: RefreshIndicatorTriggerMode.anywhere,
                    displacement: tileHeight,
                    onRefresh: () {
                      BlocProvider.of<SoundBloc>(context).add(const SoundRefreshed());
                      BlocProvider.of<ColorsBloc>(context).add(const ColorsGenerated());
                      BlocProvider.of<FabBloc>(context).add(const FabShowed());

                      return refreshCompleter.future;
                    },
                    child: FadeTransition(
                      opacity: animation,
                      child: BlocBuilder<OnboardingBloc, OnboardingState>(
                        builder: (_, OnboardingState onboardingState) {
                          final bool isHoveringAvailable =
                              onboardingState is OnboardingDoneSuccess && !platform.isMobile;

                          return ReorderableListView.builder(
                            itemCount: length,
                            scrollDirection: isPortrait ? Axis.vertical : Axis.horizontal,
                            buildDefaultDragHandles: false,
                            dragStartBehavior: DragStartBehavior.down,
                            physics: const AlwaysScrollableScrollPhysics(),
                            onReorder: (int oldIndex, int newIndex) => BlocProvider.of<ColorsBloc>(context)
                                .add(ColorsReordered(oldIndex: oldIndex, newIndex: newIndex)),
                            itemBuilder: (_, int index) {
                              final Color color = palette.elementAt(index);
                              final Color contrastColor = color.contrastColor();

                              return MouseRegion(
                                key: ValueKey<int>(index),
                                onHover: (_) => changeHoverIndex(index),
                                onExit: (_) => changeHoverIndex(),
                                child: AnimatedListTile(
                                  index: index,
                                  size: size,
                                  length: length,
                                  hoverIndex: isHoveringAvailable ? hoverIndex : null,
                                  child: ReorderableDragListener(
                                    index: index,
                                    onDragStarted: setOperation,
                                    onDragEnded: cancelOperation,
                                    child: InkWell(
                                      onDoubleTap: () {
                                        BlocProvider.of<SoundBloc>(context).add(const SoundLocked());
                                        BlocProvider.of<LockBloc>(context).add(LockChanged(index));
                                      },
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                              color: color,
                                              blurStyle: BlurStyle.solid,
                                              spreadRadius: 1,
                                              offset: const Offset(0, -1),
                                            ),
                                          ],
                                        ),
                                        child: Stack(
                                          alignment: Alignment.centerLeft,
                                          children: <Widget>[
                                            Colorpicker(
                                              index,
                                              color: color,
                                              isPortrait: isPortrait,
                                              textColor: contrastColor,
                                              buttonSize: isPortrait ? third : Size.fromHeight(size.maxHeight),
                                            ),
                                            Center(
                                              child: LockColorButton(index, color: contrastColor, buttonSize: third),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
                OnboardingOverlay(length: length, size: size),
              ],
            ),
          );
        },
      );
}
