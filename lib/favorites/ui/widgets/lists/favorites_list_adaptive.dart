import 'package:colors_ai/color_generator/blocs/colors_generated/colors_bloc.dart';
import 'package:colors_ai/color_generator/blocs/colors_locked/locked_bloc.dart';
import 'package:colors_ai/color_picker/blocs/colorpicker_dialog/colorpicker_bloc.dart';
import 'package:colors_ai/general/blocs/snackbars/snackbars_bloc.dart';
import 'package:colors_ai/navigation/blocs/navigation/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../general/extensions/color.dart';
import '../../../../general/models/color_palette/color_palette.dart';
import '../../../blocs/list_favorites/favorites_bloc.dart';
import '../../../blocs/remove_favorites/remove_favs_bloc.dart';

class FavoritesListAdaptive extends StatefulWidget {
  const FavoritesListAdaptive();

  @override
  _FavoritesListState createState() => _FavoritesListState();
}

class _FavoritesListState extends State<FavoritesListAdaptive> {
  double? hoveringColor;
  int? hoveringPalette;
  static const Duration hoverDuration = Duration(milliseconds: 400);
  static const Curve hoverCurve = Curves.easeInOutCubicEmphasized;
  static const double size = 88;

  @override
  Widget build(BuildContext context) => BlocBuilder<RemoveFavoritesBloc, RemoveFavoritesState>(
        builder: (_, removeState) => BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (_, state) {
            if (state is FavoritesLoadSuccess) {
              final List<ColorPalette> favorites = state.palettes;
              final int colorsCount = favorites.isNotEmpty ? favorites.first.colors.length : 0;
              return SingleChildScrollView(
                clipBehavior: Clip.none,
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Wrap(
                      children: List.generate(
                        favorites.length,
                        (paletteIndex) {
                          final bool isHoveringPalette = hoveringPalette == paletteIndex,
                              isSelectedToRemove = removeState.selections.contains(paletteIndex);
                          final Color removeColor = Theme.of(context).errorColor;
                          return Padding(
                            padding: const EdgeInsets.all(16),
                            child: MouseRegion(
                              onEnter: (_) => setState(() => hoveringPalette = paletteIndex),
                              onExit: (_) => setState(() => hoveringPalette = null),
                              child: Stack(
                                children: [
                                  AnimatedPositioned(
                                    right: isHoveringPalette ? 0 : size / 2,
                                    duration: hoverDuration,
                                    curve: hoverCurve,
                                    width: size / 2,
                                    height: size,
                                    child: ColoredBox(
                                      color: isHoveringPalette || isSelectedToRemove
                                          ? isSelectedToRemove
                                              ? removeColor.withOpacity(0.2)
                                              : Colors.black.withOpacity(0.1)
                                          : Colors.transparent,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Tooltip(
                                            preferBelow: false,
                                            message: 'Remove this palette', //TODO Add to L10N
                                            child: IconButton(
                                              splashRadius: size / 4,
                                              onPressed: () {
                                                BlocProvider.of<RemoveFavoritesBloc>(context)
                                                    .add(const RemoveFavoritesRemoved());
                                                BlocProvider.of<FavoritesBloc>(context)
                                                    .add(FavoritesOneRemoved(colorToRemoveIndex: paletteIndex));
                                              },
                                              icon: Icon(
                                                Icons.delete_forever_outlined,
                                                color: isSelectedToRemove
                                                    ? Theme.of(context).errorColor.withOpacity(0.8)
                                                    : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
                                              ),
                                            ),
                                          ),
                                          Tooltip(
                                            message: 'Select this palette to remove', //TODO Add to L10N,
                                            child: Checkbox(
                                              value: isSelectedToRemove,
                                              onChanged: (i) => setState(() =>
                                                  BlocProvider.of<RemoveFavoritesBloc>(context)
                                                      .add(RemoveFavoritesSelected(paletteIndex))),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      BlocProvider.of<LockedBloc>(context).add(const LockAllUnlocked());
                                      BlocProvider.of<ColorsBloc>(context)
                                          .add(ColorsRestored(palette: favorites.elementAt(paletteIndex)));
                                      BlocProvider.of<NavigationBloc>(context)
                                          .add(const NavigationGeneratorTabStarted());
                                    },
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: List<Widget>.generate(
                                          favorites.elementAt(paletteIndex).colors.length,
                                          (int colorIndex) {
                                            final Color color = favorites.elementAt(paletteIndex).colors[colorIndex],
                                                textColor = favorites
                                                    .elementAt(paletteIndex)
                                                    .colors[colorIndex]
                                                    .contrastColor();
                                            final double hoverKey = paletteIndex + (colorIndex / colorsCount);
                                            final bool isHoveringColor = hoveringColor == hoverKey;
                                            return MouseRegion(
                                              onEnter: (_) => setState(() => hoveringColor = hoverKey),
                                              onExit: (_) => setState(() => hoveringColor = null),
                                              child: AnimatedPhysicalModel(
                                                key: ValueKey<double>(hoverKey),
                                                clipBehavior: Clip.hardEdge,
                                                shape: BoxShape.rectangle,
                                                elevation: isSelectedToRemove
                                                    ? (isHoveringColor ? 12 : 6)
                                                    : (isHoveringColor ? 6 : 2),
                                                shadowColor:
                                                    isSelectedToRemove ? removeColor : Theme.of(context).shadowColor,
                                                color: color,
                                                duration: hoverDuration,
                                                curve: hoverCurve,
                                                child: SizedBox(
                                                  height: size,
                                                  width: size,
                                                  child: Center(
                                                    child: AnimatedOpacity(
                                                      duration: hoverDuration,
                                                      curve: hoverCurve,
                                                      opacity: isHoveringColor || isSelectedToRemove ? 1 : 0,
                                                      child: TextButton(
                                                        onPressed: () {
                                                          BlocProvider.of<ColorPickerBLoc>(context)
                                                              .add(ColorPickerCopied(color));
                                                          BlocProvider.of<SnackbarBloc>(context)
                                                              .add(const ColorCopiedSuccess());
                                                        },
                                                        child: Text(color.toHex(),
                                                            maxLines: 2,
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(color: textColor, fontSize: 11)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        )..add(const SizedBox(width: size / 2)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        growable: false,
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      );
}
