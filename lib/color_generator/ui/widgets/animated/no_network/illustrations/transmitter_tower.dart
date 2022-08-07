import 'package:flutter/material.dart';

class TransmitterTower extends CustomPainter {
  final Color? color;
  final double strokeWidth;
  final PaintingStyle style;

  const TransmitterTower({required this.color, this.style = PaintingStyle.stroke, this.strokeWidth = 4});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color?.withOpacity(0.6) ?? Colors.black
      ..strokeWidth = strokeWidth
      ..style = style;

    final Paint almostTransparent = Paint()
      ..strokeWidth = strokeWidth * 1.25
      ..color = Colors.black12
      ..style = style;

    final Paint paintThirdTransparent = Paint()
      ..color = color?.withOpacity(0.3) ?? Colors.black
      ..strokeWidth = strokeWidth
      ..style = style;

    final Paint redPaint = Paint()
      ..strokeWidth = strokeWidth * 1.25
      ..color = Colors.red.shade900
      ..style = style;

    final Path path_1 = Path()
      ..moveTo(size.width * 0.5, size.height * 0.15)
      ..lineTo(size.width * 0.5, size.height)
      ..moveTo(size.width * 0.19, size.height * 0.9)
      ..lineTo(size.width * 0.43, size.height * 0.23)
      ..lineTo(size.width * 0.5, size.height * 0.2)
      ..lineTo(size.width * 0.57, size.height * 0.23)
      ..lineTo(size.width * 0.81, size.height * 0.9);

    final Path path_2 = Path()
      ..moveTo(size.width * 0.37, size.height * 0.4)
      ..lineTo(size.width * 0.5, size.height * 0.45)
      ..lineTo(size.width * 0.63, size.height * 0.4)
      ..moveTo(size.width * 0.31, size.height * 0.58)
      ..lineTo(size.width * 0.5, size.height * 0.66)
      ..lineTo(size.width * 0.69, size.height * 0.58)
      ..moveTo(size.width * 0.24, size.height * 0.76)
      ..lineTo(size.width * 0.5, size.height * 0.88)
      ..lineTo(size.width * 0.76, size.height * 0.76)
      ..moveTo(size.width * 0.37, size.height * 0.2)
      ..quadraticBezierTo(size.width * 0.33, size.height * 0.17, size.width * 0.33, size.height * 0.13)
      ..quadraticBezierTo(size.width * 0.33, size.height * 0.08, size.width * 0.37, size.height * 0.05)
      ..moveTo(size.width * 0.63, size.height * 0.2)
      ..quadraticBezierTo(size.width * 0.67, size.height * 0.17, size.width * 0.67, size.height * 0.13)
      ..quadraticBezierTo(size.width * 0.67, size.height * 0.08, size.width * 0.63, size.height * 0.05);

    final Path path_3 = Path()
      ..moveTo(size.width * 0.3, size.height * 0.25)
      ..quadraticBezierTo(size.width * 0.23, size.height * 0.2, size.width * 0.23, size.height * 0.12)
      ..quadraticBezierTo(size.width * 0.24, size.height * 0.05, size.width * 0.3, 0)
      ..moveTo(size.width * 0.7, size.height * 0.25)
      ..quadraticBezierTo(size.width * 0.77, size.height * 0.2, size.width * 0.77, size.height * 0.13)
      ..quadraticBezierTo(size.width * 0.77, size.height * 0.05, size.width * 0.7, 0);

    canvas
      ..drawPath(path_1, paint)
      ..drawPath(path_2, paintThirdTransparent)
      ..drawPath(path_3, almostTransparent)
      ..drawCircle(Offset(size.width * 0.5, size.height * 0.125), 10, redPaint)
      ..drawCircle(Offset(size.width * 0.5, size.height * 0.125), 25, paintThirdTransparent);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
