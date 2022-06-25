import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ReorderableDragListener extends StatelessWidget {
  final Widget child;
  final bool enabled;
  final int index;
  final VoidCallback onDragEnded;
  final VoidCallback onDragStarted;

  const ReorderableDragListener({
    required this.onDragStarted,
    required this.onDragEnded,
    required this.child,
    required this.index,
    this.enabled = true,
    super.key,
  });

  @protected
  MultiDragGestureRecognizer createRecognizer() => DelayedMultiDragGestureRecognizer(debugOwner: this);

  @override
  Widget build(BuildContext context) => Listener(
        onPointerUp: (_) => onDragEnded(),
        onPointerDown: enabled ? (PointerDownEvent event) => _startDragging(context, event) : null,
        child: child,
      );

  void _startDragging(BuildContext context, PointerDownEvent event) {
    onDragStarted();
    SliverReorderableList.maybeOf(context)
        ?.startItemDragReorder(recognizer: createRecognizer(), index: index, event: event);
  }
}
