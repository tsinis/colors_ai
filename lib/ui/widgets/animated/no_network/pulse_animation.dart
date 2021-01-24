import 'dart:math' show sqrt;

import 'package:flutter/material.dart';

class PulseAnimation extends CustomPainter {
  PulseAnimation(this.animation) : super(repaint: animation);

  final Animation<double> animation;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(0, 150, size.width, size.height);
    for (int wave = 3; wave >= 0; wave--) {
      circle(canvas, rect, wave + animation.value);
    }
  }

  @override
  bool shouldRepaint(PulseAnimation oldDelegate) => true;

  void circle(Canvas _canvas, Rect _rect, double _value) {
    final double _opacity = (1 - (_value / 4)).clamp(0, 1).toDouble();
    final Color color = const Color(0xFF8D8D8D).withOpacity(_opacity);
    final double _radius = sqrt(_rect.width * _value * 12);

    final Paint _paint = Paint()..color = color;
    _canvas.drawCircle(_rect.topCenter, _radius, _paint);
  }
}
