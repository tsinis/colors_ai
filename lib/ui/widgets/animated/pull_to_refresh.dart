import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class PullToRefreshAnimation extends StatefulWidget {
  const PullToRefreshAnimation({this.color = Colors.black});

  final Color color;

  @override
  _PullToRefreshAnimationState createState() => _PullToRefreshAnimationState();
}

class _PullToRefreshAnimationState extends State<PullToRefreshAnimation> with AnimationMixin {
  static const Duration duration = Duration(seconds: 1);
  static const Curve curve = Curves.easeInOutQuart;

  late final Animation<Color?> color;
  late final Animation<double> opacity, height, fade;
  late final AnimationController opacityController, heightController, colorController, fadeController;

  @override
  void initState() {
    fadeController = createController()..loop(duration: const Duration(seconds: 2));
    opacityController = createController()..mirror(duration: duration);
    heightController = createController()..mirror(duration: duration);
    colorController = createController()..mirror(duration: duration);

    fade = ReverseAnimation(fadeController);
    opacity = Tween<double>(begin: 1, end: 0).chain(CurveTween(curve: curve)).animate(opacityController);
    height = Tween<double>(begin: 100, end: 200).chain(CurveTween(curve: curve)).animate(heightController);
    color = ColorTween(begin: Colors.grey[400]!.withOpacity(0.8), end: widget.color.withOpacity(0.4))
        .chain(CurveTween(curve: curve))
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
                  colors: [color.value!, widget.color.withOpacity(opacity.value)],
                ),
                border: Border.all(color: Colors.grey[400]!.withOpacity(opacity.value), width: 4),
                borderRadius: const BorderRadius.all(Radius.circular(100))),
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
