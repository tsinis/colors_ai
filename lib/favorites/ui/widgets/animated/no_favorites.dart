import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extensions.dart';
import 'no_favorites/empty_list.dart';
import 'no_favorites/magnifier.dart';

class NoFavorites extends StatefulWidget {
  const NoFavorites({super.key});

  @override
  _NoFavoritesState createState() => _NoFavoritesState();
}

class _NoFavoritesState extends State<NoFavorites> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;
  late final Animation<double> reverseAnimation;

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
          ..addStatusListener((AnimationStatus status) {
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
            children: <Widget>[
              CustomPaint(
                size: const Size(320, 320),
                painter: EmptyList(outlineColor: context.theme.textTheme.headline2!.color!),
              ),
              ScaleTransition(
                scale: animation,
                child: RotationTransition(
                  alignment: const Alignment(-0.6, 0.3),
                  turns: reverseAnimation,
                  child: CustomPaint(
                    size: const Size(240, 240),
                    painter: Magnifier(
                      backgroundColor: context.theme.floatingActionButtonTheme.backgroundColor!.withOpacity(0.3),
                      holdersColor: Colors.grey[800]!,
                      outlineColor: context.theme.textTheme.headline2!.color!,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
