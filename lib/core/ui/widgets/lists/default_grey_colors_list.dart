import 'package:flutter/material.dart';

import '../../../../color_generator/models/colors/constants.dart';
import '../../../../common/ui/widgets/helpers/orientation_switcher.dart';

class DefaultGreyList extends StatelessWidget {
  const DefaultGreyList({this.length});

  final int? length;

  @override
  Widget build(BuildContext context) => OrientationBuilder(
        builder: (_, Orientation orientation) => OrientationSwitcher(
          isPortrait: orientation == Orientation.portrait,
          children: List.generate(
            length ?? kDefaultColors.length,
            (int i) => Flexible(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: kDefaultColors[i],
                  boxShadow: [
                    BoxShadow(
                      color: kDefaultColors[i],
                      blurStyle: BlurStyle.solid,
                      spreadRadius: 1,
                      offset: const Offset(0, -1),
                    ),
                  ],
                ),
              ),
            ),
            growable: false,
          ),
        ),
      );
}
