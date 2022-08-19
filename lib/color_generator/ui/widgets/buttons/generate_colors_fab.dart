import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/theme/constants.dart';
import '../../../../color_generator/blocs/colors_generated/colors_bloc.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../navigation/blocs/navigation_bloc.dart';
import '../../../../sound/blocs/sound_bloc.dart';

class GenerateColorsFAB extends StatefulWidget {
  final Duration animationDuration;
  final Curve curve;
  final double? disabledElevation;
  final Color? focusColor;
  final Icon icon;
  final bool isExtended;
  final double padding;

  const GenerateColorsFAB({
    required this.isExtended,
    this.animationDuration = kDefaultTransitionDuration,
    this.icon = const Icon(Icons.refresh),
    this.curve = Curves.easeIn,
    this.disabledElevation = 2,
    this.padding = 16,
    this.focusColor,
    super.key,
  });

  @override
  State<GenerateColorsFAB> createState() => _GenerateColorsFABState();
}

class _GenerateColorsFABState extends State<GenerateColorsFAB> with SingleTickerProviderStateMixin {
  late final Animation<double> fabAnimation;
  late final AnimationController fadeController;
  bool isFailed = false;
  bool isGenerateTab = true;
  late bool isShowing;

  bool get isExtended => widget.isExtended;
  bool get isDisabled => isFailed || !isGenerateTab;
  String get tooltip => context.l10n.generateTabLabel;

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
    BlocProvider.of<SoundBloc>(context).add(const SoundEvent.refreshed());
    BlocProvider.of<ColorsBloc>(context).add(const ColorsGenerated());
  }

  @override
  Widget build(BuildContext context) => FadeScaleTransition(
        animation: fabAnimation,
        child: Padding(
          padding: isExtended ? EdgeInsets.all(widget.padding) : EdgeInsets.symmetric(vertical: widget.padding),
          child: BlocBuilder<NavigationBloc, NavigationState>(
            builder: (_, NavigationState navState) {
              isGenerateTab = navState == NavigationState.generate;

              return BlocBuilder<ColorsBloc, ColorsState>(
                builder: (_, ColorsState colorState) {
                  if (isExtended) {
                    isFailed = colorState is ColorsFailure;
                  }

                  return AnimatedSize(
                    duration: widget.animationDuration,
                    child: FloatingActionButton.extended(
                      focusColor: widget.focusColor ?? Colors.tealAccent[400],
                      backgroundColor: context.theme.indicatorColor,
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
