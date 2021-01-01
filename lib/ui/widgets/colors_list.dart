import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/colors_generated/colors_bloc.dart';
import '../../blocs/colors_generated/colors_event.dart';
import '../../blocs/colors_generated/colors_state.dart';
import '../../extensions/color_to_hex.dart';
import '../../extensions/list_int_to_rgb.dart';

import 'buttons/lock_color_button.dart';
import 'refrashable_reordable.dart';

class ColorsList extends StatefulWidget {
  final List<List<int>> colorList;
  final double appBarHeight;

  const ColorsList(this.colorList, {required this.appBarHeight});
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
  double get statusBarHeight => MediaQueryData.fromWindow(window).padding.top;

  @override
  Widget build(BuildContext context) => BlocConsumer<ColorsBloc, ColorsState>(
        listener: (context, state) {
          _refreshCompleter.complete();
          _refreshCompleter = Completer();
        },
        builder: (context, state) => RefreshIndicator(
          onRefresh: () {
            BlocProvider.of<ColorsBloc>(context).add(ColorsGenEvent());
            return _refreshCompleter.future;
          },
          child: RefreshableReorderableListView(
            physics: const AlwaysScrollableScrollPhysics(),
            onReorder: (int oldIndex, int newIndex) =>
                BlocProvider.of<ColorsBloc>(context).add(ColorsReorderEvent(oldIndex: oldIndex, newIndex: newIndex)),
            children: List.generate(widget.colorList.length, (index) {
              final Color color = widget.colorList[index].toColor();
              return Container(
                key: ValueKey(index),
                width: size.width,
                height: (size.height - widget.appBarHeight - statusBarHeight) / widget.colorList.length,
                color: color,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(color.toHex(), maxLines: 1),
                    LockColorButton(index),
                    const SizedBox(width: 20, height: 20),
                  ],
                ),
              );
            }, growable: false),
          ),
        ),
      );
}
