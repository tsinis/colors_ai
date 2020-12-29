import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/colors_bloc.dart';
import '../../bloc/colors_event.dart';
import '../../bloc/colors_state.dart';
import '../../extensions/color_to_hex.dart';
import '../../extensions/list_int_to_rgb.dart';
import 'list_layout.dart';
import 'reordable_list.dart';

class ColorsAIList extends StatelessWidget {
  const ColorsAIList({required this.appBarHeight});
  final double appBarHeight;

  @override
  Widget build(BuildContext context) => BlocBuilder<ColorsBloc, ColorsState>(builder: (context, state) {
        if (state is ColorsEmptyState || state is ColorsErrorState) {
          return const Center(child: Text('No Data from API'));
        } else if (state is ColorsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ColorsLoadedState) {
          final double statusBarHeight = MediaQueryData.fromWindow(window).padding.top;
          final Size size = MediaQuery.of(context).size;
          final bool isLandscape = size.width > size.height;
          final List<List<int>> colorList = state.colorsAI.list;
          return ScrollConfiguration(
            behavior: const MyBehavior(),
            child: CustomReorderableList(
              // padding: const EdgeInsets.symmetric(horizontal: 0),
              scrollDirection: isLandscape ? Axis.horizontal : Axis.vertical,
              onReorder: (int oldIndex, int newIndex) => BlocProvider.of<ColorsBloc>(context)
                  .add(ColorsReorderEvent(state.colorsAI.swapColor(oldIndex: oldIndex, newIndex: newIndex))),
              children: List.generate(colorList.length, (index) {
                final Color color = colorList[index].toColor();
                return Container(
                  key: ValueKey(index),
                  width: isLandscape ? size.width / colorList.length : size.width,
                  height: isLandscape ? size.height : (size.height - appBarHeight - statusBarHeight) / colorList.length,
                  color: color,
                  child: OrientationSwitcher(
                    isLandscape: isLandscape,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(color.toHex()),
                      ),
                      const Icon(Icons.lock_open_outlined)
                    ],
                  ),
                );
              }, growable: false),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator(backgroundColor: Colors.red));
      });
}

class MyBehavior extends ScrollBehavior {
  const MyBehavior();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) => const NeverScrollableScrollPhysics();
}
