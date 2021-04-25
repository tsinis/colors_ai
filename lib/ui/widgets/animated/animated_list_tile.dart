import 'package:flutter/material.dart';

class AnimatedListItem extends StatefulWidget {
  const AnimatedListItem({
    required this.index,
    required this.child,
    required this.length,
    this.height,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final int index;
  final int length;
  final double? height;

  @override
  _AnimatedListItemState createState() => _AnimatedListItemState();
}

class _AnimatedListItemState extends State<AnimatedListItem> {
  bool isAnimationDone = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: widget.index * 120), () {
      if (mounted) {
        setState(() => isAnimationDone = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) => (widget.height != null)
      ? AnimatedContainer(
          curve: Curves.easeOutQuart,
          height: isAnimationDone ? widget.height! : widget.index + 1 * widget.height! * widget.length,
          duration: const Duration(milliseconds: 600),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 600),
            opacity: isAnimationDone ? 1 : 0,
            child: widget.child,
          ),
        )
      : AnimatedOpacity(
          duration: const Duration(milliseconds: 600),
          opacity: isAnimationDone ? 1 : 0,
          child: widget.child,
        );
}
