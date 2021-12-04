import 'package:flutter/material.dart';

class SpaceBarButton extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final PaintingStyle style;

  const SpaceBarButton({this.color = Colors.black, this.style = PaintingStyle.stroke, this.strokeWidth = 2});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint stroke = Paint()
      ..color = color
      ..style = style
      ..strokeWidth = strokeWidth;

    final Path path = Path()
      ..moveTo(size.width * 0.81162, size.height * 0.377)
      ..lineTo(size.width * 0.13661, size.height * 0.377)
      ..lineTo(size.width * 0.1111389, size.height * 0.6954647)
      ..lineTo(size.width * 0.0984028, size.height * 1.013868)
      ..lineTo(size.width * 0.8498347, size.height * 1.013868)
      ..lineTo(size.width * 0.8370985, size.height * 0.6954647)
      ..lineTo(size.width * 0.8116263, size.height * 0.3770614)
      ..close()
      ..moveTo(size.width * 0.1, size.height)
      ..lineTo(size.width * 0.127, size.height * 0.762495)
      ..lineTo(size.width * 0.822237, size.height * 0.762495)
      ..lineTo(size.width * 0.847581, size.height)
      ..moveTo(size.width * 0.823, size.height * 0.77)
      ..lineTo(size.width * 0.811, size.height * 0.38)
      ..moveTo(size.width * 0.127, size.height * 0.77)
      ..lineTo(size.width * 0.138, size.height * 0.38);

    canvas.drawPath(path, stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
