import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../color_generator/blocs/colors_generated/colors_bloc.dart';
import '../../../../color_generator/blocs/colors_locked/lock_bloc.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../core/models/color_palette/color_palette.dart';
import '../../../../navigation/blocs/navigation/navigation_bloc.dart';
import '../../../blocs/list_favorites/favorites_bloc.dart';
import '../../../blocs/remove_favorites/remove_favorites_bloc.dart';
import 'remove_background.dart';

class FavoritesListSwipeable extends StatelessWidget {
  final Duration duration;
  final double padding;
  final double tipHeight;

  const FavoritesListSwipeable({
    this.padding = 20,
    this.tipHeight = 42,
    this.duration = const Duration(milliseconds: 800),
  });

  @override
  Widget build(BuildContext context) => BlocBuilder<RemoveFavoritesBloc, RemoveFavoritesState>(
        builder: (_, removeState) => BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (_, state) {
            if (state is FavoritesLoadSuccess) {
              final List<ColorPalette> favorites = state.palettes;

              return LayoutBuilder(
                builder: (_, size) {
                  final int colorsCount = favorites.isNotEmpty ? favorites.first.colors.length : 0;
                  final double cardHeight =
                      (size.maxWidth - (padding * 2) - (colorsCount * (padding / 2))) / colorsCount;
                  final double maxHeighForTip =
                      size.maxHeight - padding - (tipHeight * MediaQuery.of(context).textScaleFactor);
                  final bool canShowTip = favorites.length * (cardHeight + (padding * 2.5)) <= maxHeighForTip;

                  return Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Positioned(
                        bottom: padding,
                        child: AnimatedOpacity(
                          duration: duration,
                          opacity: canShowTip ? 1 : 0,
                          child: Text(
                            AppLocalizations.of(context).removeFavoritesTip,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                      ListView.builder(
                        itemCount: favorites.length,
                        itemBuilder: (_, paletteIndex) => Dismissible(
                          key: UniqueKey(),
                          onResize: () {
                            BlocProvider.of<RemoveFavoritesBloc>(context).add(const RemoveFavoritesRemoved());
                            BlocProvider.of<FavoritesBloc>(context)
                                .add(FavoritesOneRemoved(colorToRemoveIndex: paletteIndex));
                          },
                          secondaryBackground: const RemoveBackground.secondary(),
                          background: const RemoveBackground.primary(),
                          child: Semantics(
                            label: AppLocalizations.of(context).favoritePaletteSematic(paletteIndex),
                            child: ListTile(
                              onLongPress: () => BlocProvider.of<RemoveFavoritesBloc>(context)
                                  .add(RemoveFavoritesSelected(paletteIndex)),
                              enableFeedback: true,
                              minVerticalPadding: padding,
                              selectedTileColor: Theme.of(context).errorColor.withOpacity(0.2),
                              selected: removeState.selections.contains(paletteIndex),
                              contentPadding: EdgeInsets.symmetric(horizontal: padding),
                              onTap: () {
                                BlocProvider.of<LockBloc>(context).add(const LockAllUnlocked());
                                BlocProvider.of<ColorsBloc>(context)
                                    .add(ColorsRestored(palette: favorites.elementAt(paletteIndex)));
                                BlocProvider.of<NavigationBloc>(context).add(const NavigationGeneratorTabStarted());
                              },
                              title: Row(
                                children: List<Widget>.generate(
                                  favorites.elementAt(paletteIndex).colors.length,
                                  (int colorIndex) {
                                    final Color color = favorites.elementAt(paletteIndex).colors[colorIndex];
                                    final Color textColor =
                                        favorites.elementAt(paletteIndex).colors[colorIndex].contrastColor();

                                    return Expanded(
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: Card(
                                          elevation: removeState.selections.contains(paletteIndex) ? 6 : 2,
                                          shape:
                                              RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(0)),
                                          clipBehavior: Clip.none,
                                          margin: EdgeInsets.zero,
                                          color: color,
                                          child: Center(
                                            child: Text(
                                              color.toHex(),
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(color: textColor, fontSize: 11),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  growable: false,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      );
}
