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
  Widget build(BuildContext context) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (Widget child, Animation<double> animation) {
          final tween = Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0));
          return SlideTransition(position: tween.animate(animation), child: child); //TODO Fix overflow.
        },
        child: isPortrait
            ? Column(mainAxisAlignment: mainAxisAlignment, children: children)
            : Row(mainAxisAlignment: mainAxisAlignment, children: children),
      );
}
