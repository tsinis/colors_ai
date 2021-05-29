import 'package:flutter/material.dart';

class Magnifier extends CustomPainter {
  const Magnifier();

  @override
  void paint(Canvas canvas, Size size) {
    final Paint holderColor = Paint()
      ..color = Colors.grey[800]!
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 12;

    final Paint background = Paint()
      ..color = Colors.white24
      ..style = PaintingStyle.fill;

    final Paint outline = Paint()
      ..color = Colors.grey[700]!
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
