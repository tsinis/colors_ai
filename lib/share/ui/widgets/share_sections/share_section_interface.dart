import 'package:flutter/material.dart';

import '../../../../core/models/color_palette/color_palette.dart';

abstract class ShareSectionInterface extends StatelessWidget {
  final double maxWidth;
  final ColorPalette palette;
  // TODO: Update it.
  const ShareSectionInterface({required this.palette, required this.maxWidth});
}
