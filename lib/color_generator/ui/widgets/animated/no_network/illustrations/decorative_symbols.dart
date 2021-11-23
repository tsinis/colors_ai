import 'package:flutter/material.dart';

class DecorativeSymbols extends CustomPainter {
  const DecorativeSymbols({this.color = Colors.white30, this.style = PaintingStyle.stroke, this.strokeWidth = 2});

  final Color color;
  final double strokeWidth;
  final PaintingStyle style;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeWidth = strokeWidth
      ..color = color
      ..style = style;

    final Path path = Path()
      ..moveTo(size.width * 0.63, size.height)
      ..lineTo(size.width * 0.57, size.height)
      ..moveTo(size.width * 0.83, size.height * 0.57)
      ..lineTo(size.width * 0.9, size.height * 0.57)
      ..moveTo(size.width * 0.53, size.height * 0.4)
      ..lineTo(size.width * 0.6, size.height * 0.4)
      ..moveTo(size.width * 0.1, size.height * 0.7)
      ..lineTo(size.width * 0.17, size.height * 0.7)
      ..moveTo(size.width * 0.23, size.height * 0.27)
      ..lineTo(size.width * 0.3, size.height * 0.27)
      ..moveTo(size.width * 0.5, size.height * 0.13)
      ..lineTo(size.width * 0.57, size.height * 0.13)
      ..moveTo(size.width * 0.17, size.height * 0.4)
      ..lineTo(size.width * 0.23, size.height * 0.47)
      ..moveTo(size.width * 0.7, size.height * 0.17)
      ..lineTo(size.width * 0.7, size.height * 0.23)
      ..moveTo(size.width * 0.67, size.height * 0.2)
      ..lineTo(size.width * 0.73, size.height * 0.2)
      ..moveTo(size.width * 0.3, size.height * 0.165)
      ..lineTo(size.width * 0.37, size.height * 0.165)
      ..moveTo(size.width * 0.335, size.height * 0.13)
      ..lineTo(size.width * 0.335, size.height * 0.2)
      ..moveTo(0, size.height * 0.57)
      ..lineTo(size.width * 0.06, size.height * 0.57)
      ..moveTo(size.width * 0.03, size.height * 0.54)
      ..lineTo(size.width * 0.03, size.height * 0.6)
      ..moveTo(size.width * 0.8, size.height * 0.9)
      ..lineTo(size.width * 0.8, size.height * 0.96)
      ..moveTo(size.width * 0.77, size.height * 0.93)
      ..lineTo(size.width * 0.83, size.height * 0.93)
      ..moveTo(size.width * 0.43, size.height * 0.83)
      ..lineTo(size.width * 0.5, size.height * 0.9)
      ..moveTo(size.width * 0.43, size.height * 0.9)
      ..lineTo(size.width * 0.5, size.height * 0.83)
      ..moveTo(size.width * 0.07, size.height * 0.87)
      ..lineTo(size.width * 0.13, size.height * 0.93)
      ..moveTo(size.width * 0.07, size.height * 0.93)
      ..lineTo(size.width * 0.13, size.height * 0.87)
      ..moveTo(size.width * 0.37, size.height * 0.57)
      ..lineTo(size.width * 0.43, size.height * 0.63)
      ..moveTo(size.width * 0.37, size.height * 0.63)
      ..lineTo(size.width * 0.43, size.height * 0.57)
      ..moveTo(size.width * 0.17, size.height * 0.47)
      ..lineTo(size.width * 0.23, size.height * 0.4);

    canvas
      ..drawPath(path, paint)
      ..drawCircle(Offset(size.width * 0.46, size.height * 0.29), 7, paint)
      ..drawCircle(Offset(size.width * 0.97, size.height * 0.69), 7, paint)
      ..drawCircle(Offset(size.width * 0.9, size.height * 0.3), 7, paint)
      ..drawCircle(Offset(size.width * 0.26, size.height * 0.85), 7, paint)
      ..drawCircle(Offset(size.width * 0.71, size.height * 0.78), 7, paint)
      ..drawCircle(Offset(size.width * 0.06, size.height * 0.34), 7, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
