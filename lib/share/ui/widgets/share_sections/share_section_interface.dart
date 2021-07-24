import 'package:flutter/material.dart';

import '../../../../core/models/color_palette/color_palette.dart';

abstract class ShareSection extends StatelessWidget {
  const ShareSection({required this.palette, required this.maxWidth});

  final double maxWidth;
  final ColorPalette palette;
}
