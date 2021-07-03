import 'package:flutter/material.dart';

class OrientationSwitcher extends StatelessWidget {
  const OrientationSwitcher({
    required this.children,
    required this.isPortrait,
    this.mainAxisAlignment = MainAxisAlignment.spaceAround,
  });

  final List<Widget> children;
  final bool isPortrait;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) => isPortrait
      ? Column(mainAxisAlignment: mainAxisAlignment, children: children)
      : Row(mainAxisAlignment: mainAxisAlignment, children: children);
}
