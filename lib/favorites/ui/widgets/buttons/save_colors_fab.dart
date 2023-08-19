import 'dart:async';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/theme/constants.dart';
import '../../../../color_generator/blocs/colors_generated/colors_bloc.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/repository/colors_repository.dart';
import '../../../../navigation/blocs/navigation_bloc.dart';
import '../../../../sound/blocs/sound_bloc.dart';
import '../../../../vibration/blocs/vibration_bloc.dart';
import '../../../blocs/add_favorites/fab_bloc.dart';
import '../../../blocs/list_favorites/favorites_bloc.dart';

class SaveColorsFAB extends StatefulWidget {
  final bool? isExtended;

  const SaveColorsFAB({this.isExtended, super.key});

  @override
  State<SaveColorsFAB> createState() => _SaveColorsFABState();
}

class _SaveColorsFABState extends State<SaveColorsFAB> with TickerProviderStateMixin {
  static const Duration animationDuration = kDefaultTransitionDuration;

  late final Animation<Color?> colorAnimation;
  late final AnimationController colorController;
  late final Animation<double> fabAnimation;
  late final AnimationController fadeController;
  bool isFailed = false;
  bool isGenerateTab = true;

  bool get alwaysShow => widget.isExtended != null;
  bool get isDisabled => isFailed || !isGenerateTab;
  bool get isExtended => widget.isExtended ?? false;
  String get tooltip => context.l10n.savePaletteToFavorites;

  @override
  void initState() {
    super.initState();
    fadeController = AnimationController(vsync: this, duration: kDefaultShortTransitionDuration)..forward();
    colorController = AnimationController(vsync: this, duration: animationDuration);
    fabAnimation = CurvedAnimation(parent: fadeController, curve: Curves.easeIn);
    colorAnimation = ColorTween(
      end: Colors.teal[200],
    ).animate(
      CurvedAnimation(
        parent: colorController,
        curve: Curves.elasticOut,
        reverseCurve: Curves.easeOutBack,
      ),
    );
  }

  @override
  void dispose() {
    fadeController.dispose();
    colorController.dispose();
    super.dispose();
  }

  FutureOr<void> onFabPressed() {
    BlocProvider.of<SoundBloc>(context).add(const SoundEvent.favoritesAdded());
    BlocProvider.of<VibrationBloc>(context).add(const VibrationEvent.vibrated());
    BlocProvider.of<FavoritesBloc>(context)
        .add(FavoritesAdded(favorite: context.read<ColorsRepository>().palette.colors));
    if (!alwaysShow) {
      fadeController.reverse();
    }

    return colorController.forward().whenComplete(colorController.reverse);
  }

  @override
  Widget build(BuildContext context) => FadeScaleTransition(
        animation: fabAnimation,
        child: BlocBuilder<FabBloc, FabState>(
          builder: (_, FabState state) {
            // Because https://material.io/design/environment/elevation.html#elevation-in-material-design.
            if (state is FabHideInitial && !alwaysShow) {
              fadeController.reverse();
            } else if (state is FabShowInitial && !alwaysShow) {
              fadeController.forward();
            }

            return Padding(
              padding: isExtended ? const EdgeInsets.only(left: 16, top: 8, right: 16) : const EdgeInsets.only(top: 8),
              child: BlocBuilder<NavigationBloc, NavigationState>(
                builder: (_, NavigationState navState) {
                  isGenerateTab = navState == NavigationState.generate;

                  return BlocBuilder<ColorsBloc, ColorsState>(
                    builder: (_, ColorsState colorState) {
                      if (alwaysShow) {
                        isFailed = colorState is ColorsFailure;
                      }

                      return AnimatedSize(
                        duration: animationDuration,
                        child: AnimatedBuilder(
                          animation: colorAnimation,
                          builder: (_, __) => FloatingActionButton.extended(
                            disabledElevation: 2,
                            isExtended: isExtended,
                            onPressed: isDisabled ? null : onFabPressed,
                            label: Text(context.l10n.addToFavorites),
                            icon: const Icon(Icons.bookmark_add_outlined),
                            tooltip: tooltip,
                            backgroundColor: isDisabled ? context.theme.scaffoldBackgroundColor : colorAnimation.value,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      );
}
