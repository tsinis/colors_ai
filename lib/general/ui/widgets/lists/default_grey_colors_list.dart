import 'package:flutter/material.dart';

import '../../../../color_generator/models/colors/constants.dart';
import '../helpers/orientation_switcher.dart';

class DefaultGreyList extends StatelessWidget {
  const DefaultGreyList({this.length});

  final int? length;

  @override
  Widget build(BuildContext context) => OrientationSwitcher(
        isPortrait: MediaQuery.of(context).orientation == Orientation.portrait,
        children: List.generate(
            length ?? defaultColors.length,
            (int i) => Flexible(
                    child: Container(
                  color: defaultColors[i],
                )),
            growable: false),
      );
}
