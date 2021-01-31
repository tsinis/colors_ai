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
    Future.delayed(Duration(milliseconds: widget.index * 120), () => setState(() => isAnimationDone = true));
  }

  double get shadowToZero => isAnimationDone ? 3 : 0;

  @override
  Widget build(BuildContext context) => (widget.height != null)
      ? AnimatedContainer(
          curve: Curves.easeOutQuart,
          height: isAnimationDone ? widget.height! : widget.index + 1 * widget.height! * widget.length,
          duration: const Duration(milliseconds: 600),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: isAnimationDone ? Colors.black.withOpacity(0) : Colors.black26,
                  blurRadius: shadowToZero,
                  offset: Offset(0, shadowToZero),
                  spreadRadius: shadowToZero)
            ],
          ),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 600),
            opacity: isAnimationDone ? 1 : 0,
            child: widget.child,
          ),
        )
      : AnimatedOpacity(
          duration: const Duration(milliseconds: 600),
          opacity: isAnimationDone ? 1 : 0,
          child: AnimatedContainer(
            curve: Curves.easeOutQuart,
            duration: const Duration(milliseconds: 600),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: isAnimationDone ? Colors.black12 : Colors.black26,
                    blurRadius: shadowToZero / 3,
                    offset: const Offset(0, -1.5),
                    spreadRadius: shadowToZero / 3)
              ],
            ),
            child: widget.child,
          ),
        );
}
