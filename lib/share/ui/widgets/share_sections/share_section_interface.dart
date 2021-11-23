import 'package:flutter/material.dart';

import '../../../../core/models/color_palette/color_palette.dart';

abstract class ShareSectionInterface extends StatelessWidget {
  // TODO: Update it.
  const ShareSectionInterface({required this.palette, required this.maxWidth});

  final double maxWidth;
  final ColorPalette palette;
}
