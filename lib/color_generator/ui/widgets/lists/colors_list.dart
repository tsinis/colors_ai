import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:platform_info/platform_info.dart';

import '../../../../color_picker/ui/view/colorpicker.dart';
import '../../../../core/extensions/color.dart';
import '../../../../core/models/color_palette/color_palette.dart';
import '../../../../core/ui/widgets/lists/default_grey_colors_list.dart';
import '../../../../favorites/blocs/add_favorites/fab_bloc.dart';
import '../../../../oboarding/blocs/onboarding/onboarding_bloc.dart';
import '../../../../oboarding/ui/view/onboarding_overlay.dart';
import '../../../../settings/blocs/settings_hydrated_bloc.dart';
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
  late final Animation<double> animation;
  late final Animation<double> reverseAnimation;

  int? hoverIndex;

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

  bool get isPortrait => MediaQuery.of(context).orientation == Orientation.portrait;

  void changeHoverIndex([int? index]) => setState(() => hoverIndex = index);

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (_, size) {
          final int length = palette.length;
          final double tileHeight = size.maxHeight / length;
          final Size third =
              isPortrait ? Size.fromWidth(size.maxWidth / 3) : Size(size.maxWidth / length, size.maxHeight / 3);

          return BlocListener<ColorsBloc, ColorsState>(
            listener: (_, colorsState) {
              if (colorsState is ColorsLoadStarted) {
                controller.reverse();
              }
            },
            child: Stack(
              children: [
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
                FadeTransition(opacity: reverseAnimation, child: DefaultGreyList(length: length)),
                BlocConsumer<ColorsBloc, ColorsState>(
                  listener: (_, __) {
                    refreshCompleter.complete();
                    refreshCompleter = Completer();
                  },
                  builder: (_, __) => RefreshIndicator(
                    triggerMode: RefreshIndicatorTriggerMode.anywhere,
                    displacement: tileHeight,
                    onRefresh: () {
                      BlocProvider.of<SoundBloc>(context).add(const SoundRefreshed());
                      BlocProvider.of<ColorsBloc>(context).add(
                        ColorsGenerated(
                          generateColorsForUi: BlocProvider.of<SettingsBloc>(context).state.colorsForUi,
                        ),
                      );
                      BlocProvider.of<FabBloc>(context).add(const FabShowed());

                      return refreshCompleter.future;
                    },
                    child: FadeTransition(
                      opacity: animation,
                      child: BlocBuilder<OnboardingBloc, OnboardingState>(
                        builder: (_, onboardingState) {
                          final isHoveringAvailable = onboardingState is OnboardingDoneSuccess && !platform.isMobile;

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
                                child: AnimatedListItem(
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
                                        BlocProvider.of<LockedBloc>(context).add(LockChanged(index));
                                      },
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          boxShadow: [
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
                                          children: [
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
