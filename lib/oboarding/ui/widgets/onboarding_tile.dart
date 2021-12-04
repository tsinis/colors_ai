import 'package:flutter/material.dart';

import '../../../common/ui/widgets/helpers/orientation_switcher.dart';

class OnboardingTile extends StatelessWidget {
  final String? additionalText;
  final double begin;
  final double end;
  final IconData? icon;
  final bool isPortrait;
  final bool oppositeSide;
  final String text;

  const OnboardingTile(
    this.text, {
    required this.isPortrait,
    this.begin = 0,
    this.end = -0.6,
    this.oppositeSide = false,
    this.icon,
    this.additionalText,
  });

  @override
  Widget build(BuildContext context) {
    final Color gradientColor = Theme.of(context).primaryColor;

    return Expanded(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: isPortrait ? Alignment(begin, 0) : Alignment(0, begin),
            end: isPortrait ? Alignment(end, 0) : Alignment(0, end),
            colors: [gradientColor.withOpacity(0), gradientColor],
          ),
        ),
        child: LayoutBuilder(
          builder: (_, size) => SizedBox(
            width: isPortrait ? size.maxWidth : null,
            height: isPortrait ? null : size.maxHeight,
            child: FractionallySizedBox(
              widthFactor: isPortrait ? 0.88 : 1,
              heightFactor: isPortrait ? 1 : 0.88,
              child: OrientationSwitcher(
                isPortrait: !isPortrait,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: SizedBox(
                      width: isPortrait ? size.maxWidth / 3 : null,
                      height: isPortrait ? null : size.maxHeight / 3,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: oppositeSide
                              ? (additionalText != null)
                                  ? Text(
                                      additionalText!,
                                      textAlign: !isPortrait ? TextAlign.center : TextAlign.left,
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    )
                                  : Icon(icon)
                              : Text(
                                  text,
                                  textAlign: !isPortrait
                                      ? TextAlign.center
                                      : oppositeSide
                                          ? TextAlign.right
                                          : TextAlign.left,
                                ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: SizedBox(
                      width: isPortrait ? size.maxWidth / 3 : null,
                      height: isPortrait ? null : size.maxHeight / 3,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: oppositeSide
                              ? Text(
                                  text,
                                  textAlign: !isPortrait
                                      ? TextAlign.center
                                      : oppositeSide
                                          ? TextAlign.right
                                          : TextAlign.left,
                                )
                              : Icon(icon),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
