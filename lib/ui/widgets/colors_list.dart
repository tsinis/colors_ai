import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/colors_generated/colors_bloc.dart';
import '../../blocs/colors_generated/colors_event.dart';
import '../../blocs/colors_generated/colors_state.dart';
import '../../blocs/colors_locked/locked_bloc.dart';
import '../../blocs/colors_locked/locked_event.dart';
import '../../blocs/floating_action_button/fab_bloc.dart';
import '../../blocs/floating_action_button/fab_event.dart';
import '../../extensions/list_int_to_color.dart';
import 'buttons/lock_color_button.dart';
import 'colorpicker.dart';
import 'customized_default_widgets/refrashable_reordable.dart';

class ColorsList extends StatefulWidget {
  const ColorsList(this.colorsList);
  final List<List<int>> colorsList;
  @override
  _ColorsListState createState() => _ColorsListState();
}

class _ColorsListState extends State<ColorsList> {
  late Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  Size get size => MediaQuery.of(context).size;
  double get padding => MediaQueryData.fromWindow(window).padding.vertical;
  int get lenght => widget.colorsList.length;
  double get tileHeight =>
      (size.height - kBottomNavigationBarHeight - kToolbarHeight - padding - (lenght / (lenght + 1))) / lenght;
  Size get third => Size(size.width / 3, tileHeight);

  @override
  Widget build(BuildContext context) => BlocConsumer<ColorsBloc, ColorsState>(
        listener: (context, state) {
          _refreshCompleter.complete();
          _refreshCompleter = Completer();
        },
        builder: (context, state) => RefreshIndicator(
          onRefresh: () {
            BlocProvider.of<ColorsBloc>(context).add(const ColorsGenEvent());
            BlocProvider.of<FabBloc>(context).add(const FabShowEvent());
            return _refreshCompleter.future;
          },
          child: ScrollConfiguration(
            behavior: const NoGlowBehavior(),
            child: RefreshableReorderableListView(
              physics: const AlwaysScrollableScrollPhysics(),
              onDragStart: () => BlocProvider.of<FabBloc>(context).add(const FabHideEvent()),
              onDragEnd: () => BlocProvider.of<FabBloc>(context).add(const FabShowEvent()),
              onReorder: (int oldIndex, int newIndex) =>
                  BlocProvider.of<ColorsBloc>(context).add(ColorsReorderEvent(oldIndex: oldIndex, newIndex: newIndex)),
              children: List.generate(lenght, (int index) {
                final Color color = widget.colorsList[index].toColor(),
                    contrastColor = widget.colorsList[index].contrastColor();
                return InkWell(
                  onDoubleTap: () => BlocProvider.of<LockedBloc>(context).add(ChangeLockEvent(index)),
                  key: ValueKey(index),
                  child: Container(
                    width: size.width,
                    height: tileHeight,
                    color: color,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Colorpicker(index, color: color, textColor: contrastColor, buttonSize: third),
                        LockColorButton(index, color: contrastColor),
                        SizedBox.fromSize(size: third),
                      ],
                    ),
                  ),
                );
              }, growable: false),
            ),
          ),
        ),
      );
}

class NoGlowBehavior extends ScrollBehavior {
  const NoGlowBehavior();
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) => child;
}
