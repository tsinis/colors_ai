import 'package:flutter/material.dart';

import 'side_buttons.dart';
import 'spacebar_button.dart';

class SpaceBarAnimation extends StatefulWidget {
  const SpaceBarAnimation(this.color, {Key? key}) : super(key: key);

  final Color color;

  @override
  State<SpaceBarAnimation> createState() => _SpaceBarAnimationState();
}

class _SpaceBarAnimationState extends State<SpaceBarAnimation> {
  static const Duration duration = Duration(milliseconds: 800);
  static const Curve curve = Curves.elasticOut;
  bool isPressed = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(duration, animate);
  }

  void animate() {
    if (mounted) {
      setState(() => isPressed = !isPressed);
    }
  }

  @override
  Widget build(BuildContext context) => FractionallySizedBox(
        widthFactor: 0.66,
        child: FittedBox(
          child: SizedBox(
            width: 500,
            height: 100,
            child: ShaderMask(
              shaderCallback: (Rect bounds) => LinearGradient(
                stops: const [0, 0.18, 0.82, 1],
                colors: <Color>[
                  const Color(0x00FFFFFF),
                  widget.color,
                  widget.color,
                  const Color(0x00FFFFFF),
                ],
              ).createShader(bounds),
              child: Stack(
                children: [
                  const Positioned(
                    left: 12,
                    child: CustomPaint(
                      size: Size(500, 100),
                      painter: SideButtons(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    curve: curve,
                    duration: duration,
                    left: 13,
                    top: isPressed ? 16 : 2,
                    onEnd: animate,
                    child: CustomPaint(
                      size: const Size(500, 100),
                      painter: SpaceBarButton(color: widget.color),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedContainer(
                      curve: curve,
                      duration: duration,
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
