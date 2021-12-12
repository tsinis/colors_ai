import 'dart:math' show sqrt;

import 'package:flutter/material.dart';

class PulseAnimation extends CustomPainter {
  final Color color;
  final int radiusMultiplier;
  final int waves;

  final Animation<double> _animation;

  PulseAnimation(
    this._animation, {
    this.color = const Color(0xFF8D8D8D),
    this.radiusMultiplier = 12,
    this.waves = 3,
  }) : super(repaint: _animation);

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(0, 150, size.width, size.height);
    for (int wave = waves; wave >= 0; wave--) {
      _circle(canvas, rect, wave + _animation.value);
    }
  }

  @override
  bool shouldRepaint(PulseAnimation oldDelegate) => true;

  void _circle(Canvas canvas, Rect rect, double value) {
    final double opacity = (1 - (value / 4)).clamp(0, 1);
    final Color paintColor = color.withOpacity(opacity);
    final double radius = sqrt(rect.width * value * radiusMultiplier);

    final Paint paint = Paint()..color = paintColor;
    canvas.drawCircle(rect.topCenter, radius, paint);
  }
}
