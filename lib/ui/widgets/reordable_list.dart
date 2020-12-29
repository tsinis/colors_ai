import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// ignore_for_file: always_put_control_body_on_new_line

typedef ReorderCallback = void Function(int oldIndex, int newIndex);

class CustomReorderableList extends StatefulWidget {
  CustomReorderableList({
    required this.children,
    required this.onReorder,
    Key? key,
    this.header,
    this.scrollController,
    this.scrollDirection = Axis.vertical,
    this.padding,
    this.reverse = false,
  })  : assert(children.every((Widget w) => w.key != null), 'All children of this widget must have a key.'),
        super(key: key);

  final Widget? header;

  final List<Widget> children;

  final Axis scrollDirection;

  final ScrollController? scrollController;

  final EdgeInsets? padding;

  final bool reverse;

  final ReorderCallback onReorder;

  @override
  _CustomReorderableListState createState() => _CustomReorderableListState();
}

class _CustomReorderableListState extends State<CustomReorderableList> {
  final GlobalKey _overlayKey = GlobalKey(debugLabel: '$CustomReorderableList overlay key');

  late OverlayEntry _listOverlayEntry;

  @override
  void initState() {
    super.initState();
    _listOverlayEntry = OverlayEntry(
      opaque: true,
      builder: (BuildContext context) => _ReorderableListContent(
        header: widget.header,
        scrollController: widget.scrollController,
        scrollDirection: widget.scrollDirection,
        onReorder: widget.onReorder,
        padding: widget.padding,
        reverse: widget.reverse,
        children: widget.children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Overlay(key: _overlayKey, initialEntries: <OverlayEntry>[
        _listOverlayEntry,
      ]);
}

class _ReorderableListContent extends StatefulWidget {
  const _ReorderableListContent({
    required this.header,
    required this.children,
    required this.scrollController,
    required this.scrollDirection,
    required this.padding,
    required this.onReorder,
    required this.reverse,
  });

  final Widget? header;
  final List<Widget> children;
  final ScrollController? scrollController;
  final Axis scrollDirection;
  final EdgeInsets? padding;
  final ReorderCallback onReorder;
  final bool reverse;

  @override
  _ReorderableListContentState createState() => _ReorderableListContentState();
}

class _ReorderableListContentState extends State<_ReorderableListContent>
    with TickerProviderStateMixin<_ReorderableListContent> {
  static const double _defaultDropAreaExtent = 1;

  static const Duration _reorderAnimationDuration = Duration(milliseconds: 200);

  static const Duration _scrollAnimationDuration = Duration(milliseconds: 200);

  late ScrollController _scrollController;

  late AnimationController _entranceController;

  late AnimationController _ghostController;

  Key? _dragging;

  Size? _draggingFeedbackSize;

  int _dragStartIndex = 0;

  int _ghostIndex = 0;

  int _currentIndex = 0;

  int _nextIndex = 0;

  bool _scrolling = false;

  double get _dropAreaExtent {
    if (_draggingFeedbackSize == null) {
      return _defaultDropAreaExtent;
    }
    final double dropAreaWithoutMargin;
    switch (widget.scrollDirection) {
      case Axis.horizontal:
        dropAreaWithoutMargin = _draggingFeedbackSize!.width;
        break;
      case Axis.vertical:
        dropAreaWithoutMargin = _draggingFeedbackSize!.height;
        break;
    }
    return dropAreaWithoutMargin;
  }

  @override
  void initState() {
    super.initState();
    _entranceController = AnimationController(vsync: this, duration: _reorderAnimationDuration);
    _ghostController = AnimationController(vsync: this, duration: _reorderAnimationDuration);
    _entranceController.addStatusListener(_onEntranceStatusChanged);
  }

  @override
  void didChangeDependencies() {
    _scrollController = widget.scrollController ?? PrimaryScrollController.of(context) ?? ScrollController();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _entranceController.dispose();
    _ghostController.dispose();
    super.dispose();
  }

  void _requestAnimationToNextIndex() {
    if (_entranceController.isCompleted) {
      _ghostIndex = _currentIndex;
      if (_nextIndex == _currentIndex) {
        return;
      }
      _currentIndex = _nextIndex;
      _ghostController.reverse(from: 1);
      _entranceController.forward(from: 0);
    }
  }

  void _onEntranceStatusChanged(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      setState(_requestAnimationToNextIndex);
    }
  }

  void _scrollTo(BuildContext context) {
    if (_scrolling) return;
    final RenderObject contextObject = context.findRenderObject()!;
    final RenderAbstractViewport viewport = RenderAbstractViewport.of(contextObject)!;

    final double margin = _dropAreaExtent;
    final double scrollOffset = _scrollController.offset;
    final double topOffset = max(
      _scrollController.position.minScrollExtent,
      viewport.getOffsetToReveal(contextObject, 0).offset - margin,
    );
    final double bottomOffset = min(
      _scrollController.position.maxScrollExtent,
      viewport.getOffsetToReveal(contextObject, 1).offset + margin,
    );
    final bool onScreen = scrollOffset <= topOffset && scrollOffset >= bottomOffset;

    if (!onScreen) {
      _scrolling = true;
      _scrollController.position
          .animateTo(
        scrollOffset < bottomOffset ? bottomOffset : topOffset,
        duration: _scrollAnimationDuration,
        curve: Curves.easeInOut,
      )
          .then((void value) {
        setState(() {
          _scrolling = false;
        });
      });
    }
  }

  Widget _buildContainerForScrollDirection({required List<Widget> children}) {
    switch (widget.scrollDirection) {
      case Axis.horizontal:
        return Row(children: children);
      case Axis.vertical:
        return Column(children: children);
    }
  }

  Widget _wrap(Widget toWrap, int index, BoxConstraints constraints) {
    final _CustomReorderableListChildGlobalKey keyIndexGlobalKey =
        _CustomReorderableListChildGlobalKey(toWrap.key!, this);

    void onDragStarted() {
      setState(() {
        _dragging = toWrap.key;
        _dragStartIndex = index;
        _ghostIndex = index;
        _currentIndex = index;
        _entranceController.value = 1.0;
        _draggingFeedbackSize = keyIndexGlobalKey.currentContext!.size;
      });
    }

    void reorder(int startIndex, int endIndex) {
      setState(() {
        if (startIndex != endIndex) widget.onReorder(startIndex, endIndex);

        _ghostController.reverse(from: 0);
        _entranceController.reverse(from: 0);
        _dragging = null;
      });
    }

    void onDragEnded() {
      reorder(_dragStartIndex, _currentIndex);
    }

    Widget wrapWithSemantics() {
      final Map<CustomSemanticsAction, VoidCallback> semanticsActions = <CustomSemanticsAction, VoidCallback>{};

      void moveToStart() => reorder(index, 0);
      void moveToEnd() => reorder(index, widget.children.length);
      void moveBefore() => reorder(index, index - 1);

      void moveAfter() => reorder(index, index + 2);

      final MaterialLocalizations localizations = MaterialLocalizations.of(context);

      if (index > 0) {
        semanticsActions[CustomSemanticsAction(label: localizations.reorderItemToStart)] = moveToStart;
        String reorderItemBefore = localizations.reorderItemUp;
        if (widget.scrollDirection == Axis.horizontal) {
          reorderItemBefore = Directionality.of(context) == TextDirection.ltr
              ? localizations.reorderItemLeft
              : localizations.reorderItemRight;
        }
        semanticsActions[CustomSemanticsAction(label: reorderItemBefore)] = moveBefore;
      }

      if (index < widget.children.length - 1) {
        String reorderItemAfter = localizations.reorderItemDown;
        if (widget.scrollDirection == Axis.horizontal) {
          reorderItemAfter = Directionality.of(context) == TextDirection.ltr
              ? localizations.reorderItemRight
              : localizations.reorderItemLeft;
        }
        semanticsActions[CustomSemanticsAction(label: reorderItemAfter)] = moveAfter;
        semanticsActions[CustomSemanticsAction(label: localizations.reorderItemToEnd)] = moveToEnd;
      }

      return KeyedSubtree(
        key: keyIndexGlobalKey,
        child: MergeSemantics(
          child: Semantics(
            customSemanticsActions: semanticsActions,
            child: toWrap,
          ),
        ),
      );
    }

    Widget buildDragTarget(BuildContext context, List<Key?> acceptedCandidates, List<dynamic> rejectedCandidates) {
      final Widget toWrapWithSemantics = wrapWithSemantics();

      Widget child = LongPressDraggable<Key>(
        maxSimultaneousDrags: 1,
        axis: widget.scrollDirection,
        data: toWrap.key,
        ignoringFeedbackSemantics: false,
        feedback: Container(
            alignment: Alignment.topLeft,
            constraints: constraints,
            child: Material(elevation: 6, child: toWrapWithSemantics)),
        childWhenDragging: const SizedBox(),
        // dragAnchor: DragAnchor.child,
        onDragStarted: onDragStarted,
        onDragCompleted: onDragEnded,
        onDraggableCanceled: (Velocity velocity, Offset offset) => onDragEnded(),
        child: _dragging == toWrap.key ? const SizedBox() : toWrapWithSemantics,
      );

      if (index >= widget.children.length) {
        child = toWrap;
      }

      final Widget spacing;
      switch (widget.scrollDirection) {
        case Axis.horizontal:
          spacing = SizedBox(width: _dropAreaExtent);
          break;
        case Axis.vertical:
          spacing = SizedBox(height: _dropAreaExtent);
          break;
      }

      if (_currentIndex == index) {
        return _buildContainerForScrollDirection(children: <Widget>[
          SizeTransition(sizeFactor: _entranceController, axis: widget.scrollDirection, child: spacing),
          child,
        ]);
      }

      if (_ghostIndex == index) {
        return _buildContainerForScrollDirection(children: <Widget>[
          SizeTransition(sizeFactor: _ghostController, axis: widget.scrollDirection, child: spacing),
          child,
        ]);
      }
      return child;
    }

    return Builder(
        builder: (BuildContext context) => DragTarget<Key>(
              builder: buildDragTarget,
              onWillAccept: (Key? toAccept) {
                setState(() {
                  _nextIndex = index;
                  _requestAnimationToNextIndex();
                });
                _scrollTo(context);

                return _dragging == toAccept && toAccept != toWrap.key;
              },
              onAccept: (Key accepted) {},
              onLeave: (Object? leaving) {},
            ));
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_asserts_with_message
    assert(debugCheckHasMaterialLocalizations(context));

    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      const Key endWidgetKey = Key('DraggableList - End Widget');
      final Widget finalDropArea;
      switch (widget.scrollDirection) {
        case Axis.horizontal:
          finalDropArea = SizedBox(
            key: endWidgetKey,
            width: _defaultDropAreaExtent,
            height: constraints.maxHeight,
          );
          break;
        case Axis.vertical:
          finalDropArea = SizedBox(
            key: endWidgetKey,
            height: _defaultDropAreaExtent,
            width: constraints.maxWidth,
          );
          break;
      }

      final bool hasMoreThanOneChildElement = widget.children.length > 1;

      return SingleChildScrollView(
        scrollDirection: widget.scrollDirection,
        padding: widget.padding,
        controller: _scrollController,
        reverse: widget.reverse,
        child: _buildContainerForScrollDirection(
          children: <Widget>[
            if (widget.reverse && hasMoreThanOneChildElement) _wrap(finalDropArea, widget.children.length, constraints),
            if (widget.header != null) widget.header!,
            for (int i = 0; i < widget.children.length; i += 1) _wrap(widget.children[i], i, constraints),
            if (!widget.reverse && hasMoreThanOneChildElement)
              _wrap(finalDropArea, widget.children.length, constraints),
          ],
        ),
      );
    });
  }
}

@optionalTypeArgs
class _CustomReorderableListChildGlobalKey extends GlobalObjectKey {
  const _CustomReorderableListChildGlobalKey(this.subKey, this.state) : super(subKey);

  final Key subKey;

  final _ReorderableListContentState state;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is _CustomReorderableListChildGlobalKey && other.subKey == subKey && other.state == state;
  }

  @override
  int get hashCode => hashValues(subKey, state);
}
