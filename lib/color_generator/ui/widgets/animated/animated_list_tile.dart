import 'package:flutter/material.dart';

class AnimatedListItem extends StatefulWidget {
  const AnimatedListItem({
    required this.index,
    required this.child,
    required this.length,
    required this.size,
    this.hoverIndex,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final int index;
  final int length;
  final int? hoverIndex;
  final BoxConstraints size;

  @override
  _AnimatedListItemState createState() => _AnimatedListItemState();
}

class _AnimatedListItemState extends State<AnimatedListItem> {
  static const Duration duration = Duration(milliseconds: 300);
  static const double hoverPadding = 48;
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

  bool get isPortrait => MediaQuery.of(context).orientation == Orientation.portrait;
  double get tileHeight => widget.size.maxHeight / widget.length;
  double get tileWeight => widget.size.maxWidth / widget.length;

  double get additionaHoverPadding {
    if (widget.hoverIndex == null) {
      return 0;
    } else if (widget.index == widget.hoverIndex) {
      return hoverPadding;
    }

    return -(hoverPadding / widget.length);
  }

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        curve: Curves.easeInOutCubicEmphasized,
        height: isPortrait
            ? isAnimationDone
                ? tileHeight + additionaHoverPadding
                : (widget.index + 1) * tileHeight * widget.length
            : widget.size.maxHeight,
        width: isPortrait
            ? widget.size.maxWidth
            : isAnimationDone
                ? tileWeight + additionaHoverPadding
                : (widget.index + 1) * tileWeight * widget.length,
        duration: duration,
        child: AnimatedOpacity(
          duration: duration,
          opacity: isAnimationDone ? 1 : 0,
          child: widget.child,
        ),
      );
}
