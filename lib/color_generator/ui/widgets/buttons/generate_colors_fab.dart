import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../color_generator/blocs/colors_generated/colors_bloc.dart';
import '../../../../navigation/blocs/navigation/navigation_bloc.dart';
import '../../../../settings/blocs/settings_hydrated_bloc.dart';
import '../../../../sound/blocs/sounds_vibration/sound_bloc.dart';

class GenerateColorsFAB extends StatefulWidget {
  const GenerateColorsFAB({this.isExtended});

  final bool? isExtended;

  @override
  _GenerateColorsFABState createState() => _GenerateColorsFABState();
}

class _GenerateColorsFABState extends State<GenerateColorsFAB> with SingleTickerProviderStateMixin {
  static const Duration animationDuration = Duration(milliseconds: 400);

  late final AnimationController fadeController;
  late final Animation<double> fabAnimation;

  bool isGenerateTab = true;
  bool isFailed = false;
  late bool isShowing;

  @override
  void dispose() {
    fadeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    fadeController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300))..forward();
    fabAnimation = CurvedAnimation(parent: fadeController, curve: Curves.easeIn);
  }

  bool get alwaysShow => widget.isExtended != null;
  bool get isExtended => widget.isExtended ?? false;
  bool get isDisabled => isFailed || !isGenerateTab;

  void onFabPressed() {
    BlocProvider.of<SoundBloc>(context).add(const SoundRefreshed());
    BlocProvider.of<ColorsBloc>(context).add(
      ColorsGenerated(
        generateColorsForUi: BlocProvider.of<SettingsBloc>(context).state.colorsForUi,
      ),
    );
  }

  String get tooltip => AppLocalizations.of(context).generateTabLabel;

  @override
  Widget build(BuildContext context) => FadeScaleTransition(
        animation: fabAnimation,
        child: Padding(
          padding: isExtended ? const EdgeInsets.all(16) : const EdgeInsets.symmetric(vertical: 16),
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
                    child: FloatingActionButton.extended(
                      disabledElevation: 2,
                      isExtended: isExtended,
                      onPressed: isDisabled ? null : onFabPressed,
                      label: Text(tooltip),
                      icon: const Icon(Icons.refresh),
                      tooltip: tooltip,
                      focusColor: Colors.tealAccent[400],
                      backgroundColor: Theme.of(context).indicatorColor,
                    ),
                  );
                },
              );
            },
          ),
        ),
      );
}
