// import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class EmptyList extends CustomPainter {
  const EmptyList();
  @override
  void paint(Canvas canvas, Size size) {
    // final Paint bgColor = Paint()
    //   ..color = Colors.transparent
    // ..shader = ui.Gradient.linear(Offset(size.width * 0.45, size.height * 0.23),
    //     Offset(size.width * 0.45, size.height * 0.77), [Colors.grey[200]!, Colors.grey[300]!], [0, 1])
    // ..style = PaintingStyle.fill;

    // final Path background = Path()
    //   ..moveTo(size.width * 0.34, size.height * 0.59)
    //   ..lineTo(size.width * 0.34, size.height * 0.23)
    //   ..lineTo(size.width * 0.70, size.height * 0.23)
    //   ..lineTo(size.width * 0.70, size.height * 0.63)
    //   ..quadraticBezierTo(size.width * 0.70, size.height * 0.76, size.width * 0.57, size.height * 0.77)
    //   ..cubicTo(size.width * 0.51, size.height * 0.77, size.width * 0.39, size.height * 0.77, size.width * 0.33,
    //       size.height * 0.77)
    //   ..quadraticBezierTo(size.width * 0.20, size.height * 0.77, size.width * 0.20, size.height * 0.59)
    //   ..lineTo(size.width * 0.34, size.height * 0.59)
    //   ..close();

    final Paint outlineColor = Paint()
      ..color = Colors.grey[600]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final Path outline = Path()
      ..moveTo(size.width * 0.34, size.height * 0.59)
      ..lineTo(size.width * 0.34, size.height * 0.23)
      ..lineTo(size.width * 0.70, size.height * 0.23)
      ..quadraticBezierTo(size.width * 0.70, size.height * 0.55, size.width * 0.70, size.height * 0.64)
      ..quadraticBezierTo(size.width * 0.70, size.height * 0.77, size.width * 0.56, size.height * 0.77)
      ..lineTo(size.width * 0.34, size.height * 0.77)
      ..quadraticBezierTo(size.width * 0.20, size.height * 0.77, size.width * 0.20, size.height * 0.59)
      ..cubicTo(size.width * 0.26, size.height * 0.59, size.width * 0.36, size.height * 0.59, size.width * 0.43,
          size.height * 0.59)
      ..quadraticBezierTo(size.width * 0.42, size.height * 0.77, size.width * 0.56, size.height * 0.77);

    // canvas..drawPath(background, bgColor)..drawPath(outline, outlineColor);

    canvas.drawPath(outline, outlineColor);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
