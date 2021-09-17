import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../color_generator/blocs/colors_generated/colors_bloc.dart';
import '../../../../core/repository/colors_repository.dart';
import '../../../../navigation/blocs/navigation/navigation_bloc.dart';
import '../../../../sound/blocs/sounds_vibration/sound_bloc.dart';
import '../../../blocs/add_favorites/fab_bloc.dart';
import '../../../blocs/list_favorites/favorites_bloc.dart';

class SaveColorsFAB extends StatefulWidget {
  const SaveColorsFAB({this.isExtended});

  final bool? isExtended;

  @override
  _SaveColorsFABState createState() => _SaveColorsFABState();
}

class _SaveColorsFABState extends State<SaveColorsFAB> with TickerProviderStateMixin {
  static const Duration animationDuration = Duration(milliseconds: 400);

  late final AnimationController fadeController;
  late final AnimationController colorController;
  late final Animation<double> fabAnimation;
  late final Animation<Color?> colorAnimation;

  bool isGenerateTab = true;
  bool isFailed = false;

  @override
  void dispose() {
    fadeController.dispose();
    colorController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    fadeController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300))..forward();
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

  bool get alwaysShow => widget.isExtended != null;
  bool get isExtended => widget.isExtended ?? false;
  bool get isDisabled => isFailed || !isGenerateTab;

  void onFabPressed() {
    BlocProvider.of<SoundBloc>(context).add(const SoundFavoritesAdded());
    BlocProvider.of<FavoritesBloc>(context).add(FavoritesAdded(favorite: context.read<ColorsRepository>().toPalette()));
    if (!alwaysShow) {
      fadeController.reverse();
    }
    colorController.forward().whenComplete(colorController.reverse);
  }

  String get tooltip => AppLocalizations.of(context).savePaletteToFavorites;

  @override
  Widget build(BuildContext context) => FadeScaleTransition(
        animation: fabAnimation,
        child: BlocBuilder<FabBloc, FabState>(
          builder: (_, state) {
            // https://material.io/design/environment/elevation.html#elevation-in-material-design
            if (state is FabHideInitial && !alwaysShow) {
              fadeController.reverse();
            } else if (state is FabShowInitial && !alwaysShow) {
              fadeController.forward();
            }

            return Padding(
              padding: isExtended ? const EdgeInsets.fromLTRB(16, 8, 16, 0) : const EdgeInsets.only(top: 8),
              child: BlocBuilder<NavigationBloc, NavigationState>(
                builder: (_, navState) {
                  isGenerateTab = navState.tabIndex == const NavigationGenerateTabInitial().tabIndex;

                  return BlocBuilder<ColorsBloc, ColorsState>(
                    builder: (_, colorState) {
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
                            label: Text(AppLocalizations.of(context).addToFavorites),
                            icon: const Icon(Icons.bookmark_add_outlined),
                            tooltip: tooltip,
                            backgroundColor:
                                isDisabled ? Theme.of(context).scaffoldBackgroundColor : colorAnimation.value,
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
