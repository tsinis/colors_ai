import 'package:flutter/material.dart';

class AnimatedListItem extends StatefulWidget {
  const AnimatedListItem({
    required this.index,
    required this.child,
    required this.length,
    required this.height,
    required Key key,
  }) : super(key: key);

  final Widget child;
  final int index, length;
  final double height;

  @override
  _AnimatedListItemState createState() => _AnimatedListItemState();
}

class _AnimatedListItemState extends State<AnimatedListItem> {
  static const Duration duration = Duration(milliseconds: 300);
  bool isAnimationDone = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: widget.index * (duration.inMilliseconds / widget.length).round()), () {
      if (mounted) {
        setState(() => isAnimationDone = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        curve: Curves.decelerate,
        height: isAnimationDone ? widget.height : widget.index + 1 * widget.height * widget.length,
        duration: duration,
        child: AnimatedOpacity(
          duration: duration,
          opacity: isAnimationDone ? 1 : 0,
          child: widget.child,
        ),
      );
}
