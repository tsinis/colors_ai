import 'package:flutter/material.dart';

class DecorativeSymbols extends CustomPainter {
  const DecorativeSymbols();

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white30
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final Path path_0 = Path()
      ..moveTo(size.width * 0.63, size.height)
      ..lineTo(size.width * 0.57, size.height);

    final Path path_1 = Path()
      ..moveTo(size.width * 0.83, size.height * 0.57)
      ..lineTo(size.width * 0.90, size.height * 0.57);

    final Path path_2 = Path()
      ..moveTo(size.width * 0.53, size.height * 0.40)
      ..lineTo(size.width * 0.60, size.height * 0.40);

    final Path path_3 = Path()
      ..moveTo(size.width * 0.10, size.height * 0.70)
      ..lineTo(size.width * 0.17, size.height * 0.70);

    final Path path_4 = Path()
      ..moveTo(size.width * 0.23, size.height * 0.27)
      ..lineTo(size.width * 0.30, size.height * 0.27);

    final Path path_5 = Path()
      ..moveTo(size.width * 0.50, size.height * 0.13)
      ..lineTo(size.width * 0.57, size.height * 0.13);

    final Path path_6 = Path()
      ..moveTo(size.width * 0.17, size.height * 0.40)
      ..lineTo(size.width * 0.23, size.height * 0.47);

    final Path path_7 = Path()
      ..moveTo(size.width * 0.70, size.height * 0.17)
      ..lineTo(size.width * 0.70, size.height * 0.23);

    final Path path_8 = Path()
      ..moveTo(size.width * 0.67, size.height * 0.20)
      ..lineTo(size.width * 0.73, size.height * 0.20);

    final Path path_9 = Path()
      ..moveTo(size.width * 0.30, size.height * 0.165)
      ..lineTo(size.width * 0.37, size.height * 0.165);

    final Path path_10 = Path()
      ..moveTo(size.width * 0.335, size.height * 0.13)
      ..lineTo(size.width * 0.335, size.height * 0.20);

    final Path path_11 = Path()
      ..moveTo(0, size.height * 0.57)
      ..lineTo(size.width * 0.06, size.height * 0.57);

    final Path path_12 = Path()
      ..moveTo(size.width * 0.03, size.height * 0.54)
      ..lineTo(size.width * 0.03, size.height * 0.60);

    final Path path_13 = Path()
      ..moveTo(size.width * 0.80, size.height * 0.90)
      ..lineTo(size.width * 0.80, size.height * 0.96);

    final Path path_14 = Path()
      ..moveTo(size.width * 0.77, size.height * 0.93)
      ..lineTo(size.width * 0.83, size.height * 0.93);

    final Path path_15 = Path()
      ..moveTo(size.width * 0.43, size.height * 0.83)
      ..lineTo(size.width * 0.50, size.height * 0.90);

    final Path path_16 = Path()
      ..moveTo(size.width * 0.43, size.height * 0.90)
      ..lineTo(size.width * 0.50, size.height * 0.83);

    final Path path_17 = Path()
      ..moveTo(size.width * 0.07, size.height * 0.87)
      ..lineTo(size.width * 0.13, size.height * 0.93);

    final Path path_18 = Path()
      ..moveTo(size.width * 0.07, size.height * 0.93)
      ..lineTo(size.width * 0.13, size.height * 0.87);

    final Path path_19 = Path()
      ..moveTo(size.width * 0.37, size.height * 0.57)
      ..lineTo(size.width * 0.43, size.height * 0.63);

    final Path path_20 = Path()
      ..moveTo(size.width * 0.37, size.height * 0.63)
      ..lineTo(size.width * 0.43, size.height * 0.57);

    final Path path_21 = Path()
      ..moveTo(size.width * 0.17, size.height * 0.47)
      ..lineTo(size.width * 0.23, size.height * 0.40);

    canvas
      ..drawPath(path_0, paint)
      ..drawPath(path_1, paint)
      ..drawPath(path_2, paint)
      ..drawPath(path_3, paint)
      ..drawPath(path_4, paint)
      ..drawPath(path_5, paint)
      ..drawPath(path_6, paint)
      ..drawPath(path_7, paint)
      ..drawPath(path_8, paint)
      ..drawPath(path_9, paint)
      ..drawPath(path_10, paint)
      ..drawPath(path_11, paint)
      ..drawPath(path_12, paint)
      ..drawPath(path_13, paint)
      ..drawPath(path_14, paint)
      ..drawPath(path_15, paint)
      ..drawPath(path_16, paint)
      ..drawPath(path_17, paint)
      ..drawPath(path_18, paint)
      ..drawPath(path_19, paint)
      ..drawPath(path_20, paint)
      ..drawPath(path_21, paint)
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
