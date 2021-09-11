import 'package:flutter/material.dart';

class TransmitterTower extends CustomPainter {
  const TransmitterTower({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color.withOpacity(0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final Paint almostTransparent = Paint()
      ..color = Colors.black12
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    final Paint paintThirdfTransparent = Paint()
      ..color = color.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final Paint redPaint = Paint()
      ..color = Colors.red[900]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

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
      ..drawPath(path_2, paintThirdfTransparent)
      ..drawPath(path_3, almostTransparent)
      ..drawCircle(Offset(size.width * 0.5, size.height * 0.125), 10, redPaint)
      ..drawCircle(Offset(size.width * 0.5, size.height * 0.125), 25, paintThirdfTransparent);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
