import 'package:flutter/material.dart';

import '../../../../color_generator/models/colors/constants.dart';
import '../../../../common/ui/widgets/helpers/orientation_switcher.dart';

class DefaultGreyColorsList extends StatelessWidget {
  final int? length;

  const DefaultGreyColorsList({this.length, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => OrientationBuilder(
        builder: (_, Orientation orientation) => OrientationSwitcher(
          isPortrait: orientation == Orientation.portrait,
          children: List<Widget>.generate(
            length ?? kDefaultColors.length,
            (int i) => Flexible(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: kDefaultColors[i],
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: kDefaultColors[i],
                      blurStyle: BlurStyle.solid,
                      offset: const Offset(0, -1),
                      spreadRadius: 1,
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
