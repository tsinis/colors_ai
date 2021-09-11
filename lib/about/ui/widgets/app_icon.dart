import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  const AppIcon();

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 70,
        height: 88,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: SizedBox(
            width: 102.4,
            height: 102.4,
            child: Material(
              elevation: 4,
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(16),
              child: ColoredBox(
                color: const Color(0xff424242),
                child: Transform.translate(
                  offset: const Offset(-54, -80),
                  child: Stack(
                    children: <Transform>[
                      Transform.translate(
                        offset: const Offset(64, 120),
                        child: Transform.rotate(
                          angle: 1.6057,
                          child: const Rectangle(Color(0xff616161), shadowOffset: Offset(0, -1)),
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(20, 72),
                        child: Transform.rotate(
                          angle: 0.3316,
                          child: const Rectangle(Color(0xff757575), shadowOffset: Offset(0, 2)),
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(102, 64),
                        child: Transform.rotate(
                          angle: 2.7402,
                          child: const Rectangle(Color(0xff9e9e9e), shadowOffset: Offset(0, 1)),
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(126, 100),
                        child: Transform.rotate(
                          angle: 0.0349,
                          child: const Rectangle(Color(0xffbdbdbd), darkShadow: false),
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(128, 16),
                        child: Transform.rotate(
                          angle: 0.0349,
                          child: const Rectangle(Color(0xffd6d6d6), darkShadow: false),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

// ignore: prefer-single-widget-per-file
class Rectangle extends StatelessWidget {
  const Rectangle(this.color, {this.shadowOffset = const Offset(-1, 1), this.darkShadow = true});

  final Color color;
  final Offset shadowOffset;
  final bool darkShadow;

  @override
  Widget build(BuildContext context) => Container(
        width: 64,
        height: 240,
        decoration: BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(
              color: darkShadow ? Colors.black38 : const Color(0x36000000),
              offset: shadowOffset,
              blurRadius: 2,
            ),
          ],
        ),
      );
}
