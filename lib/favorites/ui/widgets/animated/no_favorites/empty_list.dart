import 'package:flutter/material.dart';

class EmptyList extends CustomPainter {
  final Color outlineColor;

  const EmptyList({required this.outlineColor});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint outlineColor = Paint()
      ..color = this.outlineColor.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final Path outline = Path()
      ..moveTo(size.width * 0.34, size.height * 0.59)
      ..lineTo(size.width * 0.34, size.height * 0.23)
      ..lineTo(size.width * 0.7, size.height * 0.23)
      ..quadraticBezierTo(size.width * 0.7, size.height * 0.55, size.width * 0.7, size.height * 0.64)
      ..quadraticBezierTo(size.width * 0.7, size.height * 0.77, size.width * 0.56, size.height * 0.77)
      ..lineTo(size.width * 0.34, size.height * 0.77)
      ..quadraticBezierTo(size.width * 0.2, size.height * 0.77, size.width * 0.2, size.height * 0.59)
      ..cubicTo(
        size.width * 0.26,
        size.height * 0.59,
        size.width * 0.36,
        size.height * 0.59,
        size.width * 0.43,
        size.height * 0.59,
      )
      ..quadraticBezierTo(size.width * 0.42, size.height * 0.77, size.width * 0.56, size.height * 0.77);

    canvas.drawPath(outline, outlineColor);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
