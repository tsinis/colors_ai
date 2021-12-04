import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../app/theme/constants.dart';
import '../../../../color_generator/blocs/colors_generated/colors_bloc.dart';
import '../../../../navigation/blocs/navigation/navigation_bloc.dart';
import '../../../../settings/blocs/settings_bloc.dart';
import '../../../../sound/blocs/sounds_vibration/sound_bloc.dart';

class GenerateColorsFAB extends StatefulWidget {
  final Duration animationDuration;
  final Curve curve;
  final double? disabledElevation;
  final Color? focusColor;
  final Icon icon;
  final bool? isExtended;
  final double padding;

  const GenerateColorsFAB({
    this.animationDuration = kDefaultTransitionDuration,
    this.icon = const Icon(Icons.refresh),
    this.curve = Curves.easeIn,
    this.disabledElevation = 2,
    this.padding = 16,
    this.focusColor,
    this.isExtended,
  });

  @override
  _GenerateColorsFABState createState() => _GenerateColorsFABState();
}

class _GenerateColorsFABState extends State<GenerateColorsFAB> with SingleTickerProviderStateMixin {
  late final Animation<double> fabAnimation;
  late final AnimationController fadeController;
  bool isFailed = false;
  bool isGenerateTab = true;
  late bool isShowing;

  bool get alwaysShow => widget.isExtended != null;

  bool get isExtended => widget.isExtended ?? false;

  bool get isDisabled => isFailed || !isGenerateTab;

  String get tooltip => AppLocalizations.of(context).generateTabLabel;

  @override
  void dispose() {
    fadeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    fadeController = AnimationController(vsync: this, duration: kDefaultShortTransitionDuration)..forward();
    fabAnimation = CurvedAnimation(parent: fadeController, curve: widget.curve);
  }

  void onFabPressed() {
    BlocProvider.of<SoundBloc>(context).add(const SoundRefreshed());
    BlocProvider.of<ColorsBloc>(context).add(
      ColorsGenerated(
        generateColorsForUi: BlocProvider.of<SettingsBloc>(context).state.colorsForUi,
      ),
    );
  }

  @override
  Widget build(BuildContext context) => FadeScaleTransition(
        animation: fabAnimation,
        child: Padding(
          padding: isExtended ? EdgeInsets.all(widget.padding) : EdgeInsets.symmetric(vertical: widget.padding),
          child: BlocBuilder<NavigationBloc, NavigationState>(
            builder: (_, navState) {
              isGenerateTab = navState.tabIndex == const NavigationGenerateTabInitial().tabIndex;

              return BlocBuilder<ColorsBloc, ColorsState>(
                builder: (_, colorState) {
                  if (alwaysShow) {
                    isFailed = colorState is ColorsFailure;
                  }

                  return AnimatedSize(
                    duration: widget.animationDuration,
                    child: FloatingActionButton.extended(
                      focusColor: widget.focusColor ?? Colors.tealAccent[400],
                      backgroundColor: Theme.of(context).indicatorColor,
                      disabledElevation: widget.disabledElevation,
                      onPressed: isDisabled ? null : onFabPressed,
                      isExtended: isExtended,
                      label: Text(tooltip),
                      icon: widget.icon,
                      tooltip: tooltip,
                    ),
                  );
                },
              );
            },
          ),
        ),
      );
}
