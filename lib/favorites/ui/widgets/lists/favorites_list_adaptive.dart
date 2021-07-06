import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../color_generator/blocs/colors_generated/colors_bloc.dart';
import '../../../../color_generator/blocs/colors_locked/locked_bloc.dart';
import '../../../../general/extensions/color.dart';
import '../../../../general/models/color_palette/color_palette.dart';
import '../../../../navigation/blocs/navigation/navigation_bloc.dart';
import '../../../blocs/list_favorites/favorites_bloc.dart';
import '../../../blocs/remove_favorites/remove_favs_bloc.dart';

class FavoritesListAdaptive extends StatefulWidget {
  const FavoritesListAdaptive();

  @override
  _FavoritesListState createState() => _FavoritesListState();
}

class _FavoritesListState extends State<FavoritesListAdaptive> {
  static const double padding = 16, tipHeight = 42;
  bool isDissmised = true;

  @override
  Widget build(BuildContext context) => BlocBuilder<RemoveFavoritesBloc, RemoveFavoritesState>(
        builder: (_, removeState) => BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (_, state) {
            if (state is FavoritesLoadSuccess) {
              final List<ColorPalette> favorites = state.palettes;
              final int colorsCount = favorites.isNotEmpty ? favorites.first.colors.length : 0;
              return Wrap(
                children: [
                  Wrap(
                    children: List.generate(
                      favorites.length,
                      (paletteIndex) => Row(
                        children: List<Widget>.generate(
                          favorites.elementAt(paletteIndex).colors.length,
                          (int colorIndex) {
                            final Color color = favorites.elementAt(paletteIndex).colors[colorIndex];
                            final Color textColor =
                                favorites.elementAt(paletteIndex).colors[colorIndex].contrastColor();
                            return AnimatedPhysicalModel(
                              shape: BoxShape.rectangle,
                              elevation: 5,
                              shadowColor: Theme.of(context).shadowColor,
                              color: color,
                              duration: const Duration(seconds: 1),
                              child: SizedBox(
                                height: 64,
                                child: Center(
                                  child: Text(color.toHex(),
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: textColor, fontSize: 11)),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      );
}
