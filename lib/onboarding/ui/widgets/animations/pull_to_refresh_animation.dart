import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import '../../../../app/theme/constants.dart';

class PullToRefreshAnimation extends StatefulWidget {
  final Color color;
  final Curve curve;
  final Duration duration;

  const PullToRefreshAnimation({
    this.color = Colors.black,
    this.curve = Curves.easeInOutQuart,
    this.duration = kDefaultLongTransitionDuration,
    super.key,
  });

  @override
  State<PullToRefreshAnimation> createState() => _PullToRefreshAnimationState();
}

class _PullToRefreshAnimationState extends State<PullToRefreshAnimation> with AnimationMixin<PullToRefreshAnimation> {
  late final Animation<Color?> color;
  late final AnimationController colorController;
  late final Animation<double> fade;
  late final AnimationController fadeController;
  late final Animation<double> height;
  late final AnimationController heightController;
  late final Animation<double> opacity;
  late final AnimationController opacityController;

  @override
  void initState() {
    fadeController = createController()..loop(duration: const Duration(seconds: 2));
    opacityController = createController()..mirror(duration: widget.duration);
    heightController = createController()..mirror(duration: widget.duration);
    colorController = createController()..mirror(duration: widget.duration);

    fade = ReverseAnimation(fadeController);
    opacity = Tween<double>(begin: 1, end: 0).chain(CurveTween(curve: widget.curve)).animate(opacityController);
    height = Tween<double>(begin: 100, end: 200).chain(CurveTween(curve: widget.curve)).animate(heightController);
    color = ColorTween(begin: Colors.grey.shade400.withOpacity(0.8), end: widget.color.withOpacity(0.4))
        .chain(CurveTween(curve: widget.curve))
        .animate(colorController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => FittedBox(
        fit: BoxFit.scaleDown,
        child: Transform.translate(
          offset: Offset(0, height.value),
          child: Container(
            width: 100,
            height: height.value,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[color.value?? Colors.transparent, widget.color.withOpacity(opacity.value)],
              ),
              border: Border.all(color: Colors.grey.shade400.withOpacity(opacity.value), width: 4),
              borderRadius: const BorderRadius.all(Radius.circular(100)),
            ),
            child: FadeTransition(
              opacity: fade,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 90,
                  decoration:
                      BoxDecoration(color: widget.color, borderRadius: const BorderRadius.all(Radius.circular(50))),
                ),
              ),
            ),
          ),
        ),
      );
}
