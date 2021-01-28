import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class PullToRefreshAnimation extends StatefulWidget {
  const PullToRefreshAnimation();

  @override
  _PullToRefreshAnimationState createState() => _PullToRefreshAnimationState();
}

class _PullToRefreshAnimationState extends State<PullToRefreshAnimation> with AnimationMixin {
  static const Duration _duration = Duration(seconds: 2);

  late Animation<Color?> _color;
  final Curve _curve = Curves.easeInOutQuart;
  late Animation<double> _opacity, _height, _fade;
  late AnimationController _opacityController, _heightController, _colorController, _fadeController;

  @override
  void initState() {
    _fadeController = createController()..loop(duration: const Duration(seconds: 4));
    _opacityController = createController()..mirror(duration: _duration);
    _heightController = createController()..mirror(duration: _duration);
    _colorController = createController()..mirror(duration: _duration);

    _fade = ReverseAnimation(_fadeController);
    _opacity = Tween<double>(begin: 1, end: 0).chain(CurveTween(curve: _curve)).animate(_opacityController);
    _height = Tween<double>(begin: 100, end: 200).chain(CurveTween(curve: _curve)).animate(_heightController);
    _color = ColorTween(begin: Colors.grey, end: Colors.grey.withOpacity(0))
        .chain(CurveTween(curve: _curve))
        .animate(_colorController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => FittedBox(
        fit: BoxFit.scaleDown,
        child: Transform.translate(
          offset: Offset(0, _height.value),
          child: Container(
            width: 100,
            height: _height.value,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [_color.value!, Colors.white.withOpacity(_opacity.value.clamp(0.3, 1))],
                ),
                border: Border.all(color: Colors.white.withOpacity(_opacity.value), width: 4),
                borderRadius: const BorderRadius.all(Radius.circular(100))),
            child: FadeTransition(
              opacity: _fade,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 90,
                  decoration:
                      const BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.all(Radius.circular(50))),
                ),
              ),
            ),
          ),
        ),
      );
}
