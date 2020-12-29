import 'package:flutter/material.dart';

class OrientationSwitcher extends StatelessWidget {
  const OrientationSwitcher({required this.children, required this.isLandscape});

  final List<Widget> children;
  final bool isLandscape;

  static const MainAxisAlignment _alignment = MainAxisAlignment.spaceAround;

  @override
  Widget build(BuildContext context) => isLandscape
      ? Column(mainAxisAlignment: _alignment, children: children)
      : Row(mainAxisAlignment: _alignment, children: children);
}
