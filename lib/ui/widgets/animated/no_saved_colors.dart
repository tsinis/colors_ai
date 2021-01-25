import 'package:flutter/material.dart';

import 'no_saved_colors/list.dart';
import 'no_saved_colors/magnifier.dart';

class NoSavedColors extends StatefulWidget {
  const NoSavedColors();

  @override
  _NoSavedColorsState createState() => _NoSavedColorsState();
}

class _NoSavedColorsState extends State<NoSavedColors> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation, reverseAnimation;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 10), lowerBound: 0.62, upperBound: 0.9)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller.reverse();
            } else if (status == AnimationStatus.dismissed) {
              controller.forward();
            }
          });
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    reverseAnimation = ReverseAnimation(animation);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) => FittedBox(
        fit: BoxFit.scaleDown,
        child: SizedBox(
          width: 320,
          child: Stack(
            alignment: Alignment.center,
            children: [
              const CustomPaint(size: Size(320, 320), painter: EmptyList()),
              ScaleTransition(
                scale: animation,
                child: RotationTransition(
                  alignment: const Alignment(-0.6, 0.3),
                  turns: reverseAnimation,
                  child: const CustomPaint(size: Size(240, 240), painter: Magnifier()),
                ),
              ),
            ],
          ),
        ),
      );
}
