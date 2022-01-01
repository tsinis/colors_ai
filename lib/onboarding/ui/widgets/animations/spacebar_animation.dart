import 'package:flutter/material.dart';

import 'side_buttons.dart';
import 'spacebar_button.dart';

class SpaceBarAnimation extends StatefulWidget {
  final Color color;
  final Curve curve;
  final Duration duration;
  final List<double> gradientStops;
  final Size relativeSize;
  final Color transparentColor;
  final double widthFactor;

  List<Color> get fadeColorsGradient => <Color>[transparentColor, color, color, transparentColor];

  const SpaceBarAnimation(
    this.color, {
    this.duration = const Duration(milliseconds: 800),
    this.transparentColor = const Color(0x00FFFFFF),
    this.gradientStops = const <double>[0, 0.18, 0.82, 1],
    this.relativeSize = const Size(500, 100),
    this.curve = Curves.elasticOut,
    this.widthFactor = 0.66,
    Key? key,
  }) : super(key: key);

  @override
  State<SpaceBarAnimation> createState() => _SpaceBarAnimationState();
}

class _SpaceBarAnimationState extends State<SpaceBarAnimation> {
  bool isPressed = false;

  @override
  void initState() {
    super.initState();
    Future<void>.delayed(widget.duration, animate);
  }

  void animate() {
    if (mounted) {
      setState(() => isPressed = !isPressed);
    }
  }

  @override
  Widget build(BuildContext context) => FractionallySizedBox(
        widthFactor: widget.widthFactor,
        child: FittedBox(
          child: SizedBox(
            width: widget.relativeSize.width,
            height: widget.relativeSize.height,
            child: ShaderMask(
              shaderCallback: (Rect bounds) => LinearGradient(
                stops: widget.gradientStops,
                colors: widget.fadeColorsGradient,
              ).createShader(bounds),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 12,
                    child: CustomPaint(
                      size: widget.relativeSize,
                      painter: const SideButtons(color: Colors.white),
                    ),
                  ),
                  AnimatedPositioned(
                    curve: widget.curve,
                    duration: widget.duration,
                    left: 13,
                    top: isPressed ? 16 : 2,
                    onEnd: animate,
                    child: CustomPaint(
                      size: widget.relativeSize,
                      painter: SpaceBarButton(color: widget.color),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedContainer(
                      curve: widget.curve,
                      duration: widget.duration,
                      color: widget.color,
                      height: 2,
                      width: isPressed ? 367 : 372,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
