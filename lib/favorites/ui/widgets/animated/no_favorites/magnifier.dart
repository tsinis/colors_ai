import 'package:flutter/material.dart';

class Magnifier extends CustomPainter {
  const Magnifier({required this.backgroundColor, required this.outlineColor, required this.holdersColor});

  final Color backgroundColor;
  final Color outlineColor;
  final Color holdersColor;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint holderColor = Paint()
      ..color = holdersColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 12;

    final Paint background = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    final Paint outline = Paint()
      ..color = outlineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    final Path holder = Path()
      ..moveTo(size.width * 0.58, size.height * 0.46)
      ..lineTo(size.width * 0.77, size.height * 0.64);

    canvas
      ..drawPath(holder, holderColor)
      ..drawCircle(Offset(size.width * 0.435, size.height * 0.3), 48, background)
      ..drawCircle(Offset(size.width * 0.435, size.height * 0.3), 48, outline);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
