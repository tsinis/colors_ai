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

  // double get shadowFromZero => isAnimationDone ? 5 : 0;

  @override
  Widget build(BuildContext context) => (widget.height != null)
      ? AnimatedContainer(
          curve: Curves.easeOutQuart,
          height: isAnimationDone ? widget.height! : widget.index + 1 * widget.height! * widget.length,
          duration: const Duration(milliseconds: 600),
          // decoration: BoxDecoration(
          //   boxShadow: [
          //     BoxShadow(
          //         color: Colors.black26,
          //         blurRadius: shadowFromZero / 1.5,
          //         offset: Offset(0, shadowFromZero),
          //         spreadRadius: shadowFromZero)
          //   ],
          // ),
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
