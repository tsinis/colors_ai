import 'package:flutter/material.dart';

import '../../../../app/theme/constants.dart';

class AnimatedListTile extends StatefulWidget {
  final Widget child;
  final Curve curve;
  final Duration duration;
  final int? hoverIndex;
  final double hoverPadding;
  final int index;
  final int length;
  final BoxConstraints size;

  const AnimatedListTile({
    required this.index,
    required this.child,
    required this.length,
    required this.size,
    this.duration = kDefaultShortTransitionDuration,
    this.curve = kDefaultTransitionCurve,
    this.hoverPadding = 32,
    this.hoverIndex,
    Key? key,
  }) : super(key: key);

  @override
  _AnimatedListItemState createState() => _AnimatedListItemState();
}

class _AnimatedListItemState extends State<AnimatedListTile> {
  bool isAnimationDone = false;

  bool get isPortrait => MediaQuery.of(context).orientation == Orientation.portrait;

  double get tileHeight => widget.size.maxHeight / widget.length;

  double get tileWeight => widget.size.maxWidth / widget.length;

  double get additionalHoverPadding {
    if (widget.hoverIndex == null) {
      return 0;
    } else if (widget.index == widget.hoverIndex) {
      return widget.hoverPadding;
    }

    return -(widget.hoverPadding / widget.length);
  }

  @override
  void initState() {
    super.initState();
    Future<void>.delayed(Duration(milliseconds: widget.index * (widget.duration.inMilliseconds ~/ widget.length)), () {
      if (mounted) {
        setState(() => isAnimationDone = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        curve: widget.curve,
        height: isPortrait
            ? isAnimationDone
                ? tileHeight + additionalHoverPadding
                : (widget.index + 1) * tileHeight * widget.length
            : widget.size.maxHeight,
        width: isPortrait
            ? widget.size.maxWidth
            : isAnimationDone
                ? tileWeight + additionalHoverPadding
                : (widget.index + 1) * tileWeight * widget.length,
        duration: widget.duration,
        child: AnimatedOpacity(
          duration: widget.duration,
          opacity: isAnimationDone ? 1 : 0,
          child: widget.child,
        ),
      );
}
