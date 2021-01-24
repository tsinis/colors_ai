import 'package:flutter/material.dart';

class DefaultGreyList extends StatelessWidget {
  const DefaultGreyList({required this.tileWidth, required this.tileHeight, this.lenght = 5});

  final int lenght;
  final double tileWidth, tileHeight;

  @override
  Widget build(BuildContext context) => Column(
        children: List.generate(
          lenght,
          (int index) => Container(
            width: tileWidth,
            height: tileHeight,
            color: Colors.grey[600]!.withOpacity((0.33 + (index / 8)).clamp(0.33, 1)),
            // color: Colors.grey[400 + (100 * index)],
          ),
          growable: false,
        ),
      );
}
