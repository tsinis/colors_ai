import 'package:flutter/material.dart';

import '../../../../color_generator/models/colors/constants.dart';

class DefaultGreyList extends StatelessWidget {
  const DefaultGreyList({required this.tileWidth, required this.tileHeight, this.length});

  final int? length;
  final double tileWidth, tileHeight;

  @override
  Widget build(BuildContext context) => Column(
        children: List.generate(length ?? defaultColors.length,
            (int i) => Container(width: tileWidth, height: tileHeight, color: defaultColors[i]),
            growable: false),
      );
}
