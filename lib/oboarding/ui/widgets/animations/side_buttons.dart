import 'package:flutter/material.dart';

class SideButtons extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final PaintingStyle style;

  const SideButtons({this.color = Colors.grey, this.style = PaintingStyle.stroke, this.strokeWidth = 1.6});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint stroke = Paint()
      ..strokeWidth = strokeWidth
      ..color = color
      ..style = style;

    final Path path = Path()
      ..moveTo(size.width * 1.5864, size.height * 0.3793)
      ..lineTo(size.width * 0.9113, size.height * 0.3793)
      ..lineTo(size.width * 0.8859, size.height * 0.6977)
      ..lineTo(size.width * 0.8731, size.height * 0.9859)
      ..lineTo(size.width * 1.6246, size.height * 0.9859)
      ..lineTo(size.width * 1.6118, size.height * 0.6977)
      ..lineTo(size.width * 1.4, size.height * 0.3793)
      ..close()
      ..moveTo(size.width * 0.042, size.height * 0.37665)
      ..lineTo(size.width * -0.6329, size.height * 0.37665)
      ..lineTo(size.width * -0.6584, size.height * 0.69505)
      ..lineTo(size.width * -0.6712, size.height * 0.9859)
      ..lineTo(size.width * 0.08, size.height * 0.9859)
      ..lineTo(size.width * 0.0675, size.height * 0.69505)
      ..lineTo(size.width * 0.042, size.height * 0.37665)
      ..close()
      ..moveTo(size.width * 0.875, size.height * 0.99)
      ..lineTo(size.width * 0.9, size.height * 0.7558)
      ..lineTo(size.width * 1.59816, size.height * 0.7558)
      ..lineTo(size.width * 1.6235, size.height)
      ..moveTo(size.width * 0.052, size.height * 0.76)
      ..lineTo(size.width * 0.042, size.height * 0.38)
      ..moveTo(size.width * -0.6, size.height)
      ..lineTo(size.width * -0.6, size.height * 0.7)
      ..lineTo(size.width * 0.052, size.height * 0.7524)
      ..lineTo(size.width * 0.078, size.height * 0.98)
      ..moveTo(size.width * 0.9, size.height * 0.765)
      ..lineTo(size.width * 0.91, size.height * 0.39);

    canvas.drawPath(path, stroke);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
