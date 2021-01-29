import 'package:flutter/material.dart';
import '../../../models/colors/constants.dart';

class DefaultGreyList extends StatelessWidget {
  const DefaultGreyList({required this.tileWidth, required this.tileHeight, this.length});

  final int? length;
  final double tileWidth, tileHeight;

  @override
  Widget build(BuildContext context) => Column(
        children: List.generate(
            length ?? defaultColors.length,
            (int index) => Container(
                  width: tileWidth,
                  height: tileHeight,
                  color: defaultColors[index],
                ),
            growable: false),
      );
}
