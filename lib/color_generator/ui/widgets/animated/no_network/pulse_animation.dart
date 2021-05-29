import 'dart:math' show sqrt;

import 'package:flutter/material.dart';

class PulseAnimation extends CustomPainter {
  PulseAnimation(this._animation) : super(repaint: _animation);

  final Animation<double> _animation;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(0, 150, size.width, size.height);
    for (int wave = 3; wave >= 0; wave--) {
      _circle(canvas, rect, wave + _animation.value);
    }
  }

  @override
  bool shouldRepaint(PulseAnimation oldDelegate) => true;

  void _circle(Canvas canvas, Rect rect, double value) {
    final double opacity = (1 - (value / 4)).clamp(0, 1).toDouble();
    final Color color = const Color(0xFF8D8D8D).withOpacity(opacity);
    final double radius = sqrt(rect.width * value * 12);

    final Paint paint = Paint()..color = color;
    canvas.drawCircle(rect.topCenter, radius, paint);
  }
}
