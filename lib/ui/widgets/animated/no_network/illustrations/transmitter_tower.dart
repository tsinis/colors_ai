import 'package:flutter/material.dart';

class TransmitterTower extends CustomPainter {
  const TransmitterTower();
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.grey[700]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final Paint almostTransparent = Paint()
      ..color = Colors.black12
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    final Paint paintThirdfTransparent = Paint()
      ..color = Colors.black26
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final Paint redPaint = Paint()
      ..color = Colors.red[900]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final Path path_0 = Path()
      ..moveTo(size.width * 0.50, size.height * 0.15)
      ..lineTo(size.width * 0.50, size.height);

    final Path path_1 = Path()
      ..moveTo(size.width * 0.19, size.height * 0.90)
      ..lineTo(size.width * 0.43, size.height * 0.23)
      ..lineTo(size.width * 0.50, size.height * 0.20)
      ..lineTo(size.width * 0.57, size.height * 0.23)
      ..lineTo(size.width * 0.81, size.height * 0.90);

    final Path path_2 = Path()
      ..moveTo(size.width * 0.37, size.height * 0.40)
      ..lineTo(size.width * 0.50, size.height * 0.45)
      ..lineTo(size.width * 0.63, size.height * 0.40);

    final Path path_3 = Path()
      ..moveTo(size.width * 0.31, size.height * 0.58)
      ..lineTo(size.width * 0.50, size.height * 0.66)
      ..lineTo(size.width * 0.69, size.height * 0.58);

    final Path path_4 = Path()
      ..moveTo(size.width * 0.24, size.height * 0.76)
      ..lineTo(size.width * 0.50, size.height * 0.88)
      ..lineTo(size.width * 0.76, size.height * 0.76);

    final Path path_5 = Path()
      ..moveTo(size.width * 0.37, size.height * 0.20)
      ..quadraticBezierTo(size.width * 0.33, size.height * 0.17, size.width * 0.33, size.height * 0.13)
      ..quadraticBezierTo(size.width * 0.33, size.height * 0.08, size.width * 0.37, size.height * 0.05);

    final Path path_6 = Path()
      ..moveTo(size.width * 0.63, size.height * 0.20)
      ..quadraticBezierTo(size.width * 0.67, size.height * 0.17, size.width * 0.67, size.height * 0.13)
      ..quadraticBezierTo(size.width * 0.67, size.height * 0.08, size.width * 0.63, size.height * 0.05);

    final Path path_7 = Path()
      ..moveTo(size.width * 0.30, size.height * 0.25)
      ..quadraticBezierTo(size.width * 0.23, size.height * 0.20, size.width * 0.23, size.height * 0.12)
      ..quadraticBezierTo(size.width * 0.24, size.height * 0.05, size.width * 0.30, 0);

    final Path path_8 = Path()
      ..moveTo(size.width * 0.70, size.height * 0.25)
      ..quadraticBezierTo(size.width * 0.77, size.height * 0.20, size.width * 0.77, size.height * 0.13)
      ..quadraticBezierTo(size.width * 0.77, size.height * 0.05, size.width * 0.70, 0);

    canvas
      ..drawPath(path_0, paint)
      ..drawPath(path_1, paint)
      ..drawPath(path_2, paintThirdfTransparent)
      ..drawPath(path_3, paintThirdfTransparent)
      ..drawPath(path_4, paintThirdfTransparent)
      ..drawPath(path_5, paintThirdfTransparent)
      ..drawPath(path_6, paintThirdfTransparent)
      ..drawPath(path_7, almostTransparent)
      ..drawPath(path_8, almostTransparent)
      ..drawCircle(Offset(size.width * 0.5, size.height * 0.125), 10, redPaint)
      ..drawCircle(Offset(size.width * 0.5, size.height * 0.125), 25, paintThirdfTransparent);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
