import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ReorderableDragListener extends StatelessWidget {
  const ReorderableDragListener({
    required this.onDragStarted,
    required this.onDragEnded,
    required this.child,
    required this.index,
    this.enabled = true,
  });

  final VoidCallback onDragStarted, onDragEnded;
  final Widget child;
  final int index;
  final bool enabled;

  @protected
  MultiDragGestureRecognizer createRecognizer() => DelayedMultiDragGestureRecognizer(debugOwner: this);

  void _startDragging(BuildContext context, PointerDownEvent event) {
    onDragStarted();
    SliverReorderableList.maybeOf(context)?.startItemDragReorder(
      recognizer: createRecognizer(),
      index: index,
      event: event,
    );
  }

  @override
  Widget build(BuildContext context) => Listener(
      onPointerUp: (_) => onDragEnded(),
      onPointerDown: enabled ? (PointerDownEvent event) => _startDragging(context, event) : null,
      child: child);
}
