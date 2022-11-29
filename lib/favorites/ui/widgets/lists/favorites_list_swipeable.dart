import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../color_generator/blocs/colors_generated/colors_bloc.dart';
import '../../../../color_generator/blocs/colors_locked/lock_bloc.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/models/color_palette/color_palette.dart';
import '../../../../navigation/blocs/navigation_bloc.dart';
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
    super.key,
  });

  void _onTap(BuildContext context, ColorPalette palette) {
    BlocProvider.of<LockBloc>(context).add(const LockAllUnlocked());
    BlocProvider.of<ColorsBloc>(context).add(ColorsRestored(palette: palette));
    BlocProvider.of<NavigationBloc>(context).add(const NavigationEvent.started());
  }

  void _onResize(BuildContext context, int colorToRemoveIndex) {
    BlocProvider.of<RemoveFavoritesBloc>(context).add(const RemoveFavoritesRemoved());
    BlocProvider.of<FavoritesBloc>(context).add(FavoritesOneRemoved(colorToRemoveIndex: colorToRemoveIndex));
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<RemoveFavoritesBloc, RemoveFavoritesState>(
        builder: (_, RemoveFavoritesState removeState) => BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (_, FavoritesState state) {
            if (state is FavoritesLoadSuccess) {
              final List<ColorPalette> favorites = state.palettes;

              return LayoutBuilder(
                builder: (_, BoxConstraints size) {
                  final int colorsCount = favorites.isNotEmpty ? favorites.first.colors.length : 0;
                  final double cardHeight =
                      (size.maxWidth - (padding * 2) - (colorsCount * (padding / 2))) / colorsCount;
                  final double maxHeighForTip = size.maxHeight - padding - (tipHeight * context.media.textScaleFactor);
                  final bool canShowTip = favorites.length * (cardHeight + (padding * 2.5)) <= maxHeighForTip;

                  return Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: <Widget>[
                      Positioned(
                        bottom: padding,
                        child: AnimatedOpacity(
                          duration: duration,
                          opacity: canShowTip ? 1 : 0,
                          child: Text(
                            context.l10n.removeFavoritesTip,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                      ListView.builder(
                        itemCount: favorites.length,
                        itemBuilder: (_, int paletteIndex) => Dismissible(
                          key: UniqueKey(),
                          onResize: () => _onResize(context, paletteIndex),
                          secondaryBackground: const RemoveBackground.secondary(),
                          background: const RemoveBackground.primary(),
                          child: Semantics(
                            label: context.l10n.favoritePaletteSematic(paletteIndex),
                            child: ListTile(
                              onLongPress: () => BlocProvider.of<RemoveFavoritesBloc>(context)
                                  .add(RemoveFavoritesSelected(paletteIndex)),
                              enableFeedback: true,
                              minVerticalPadding: padding,
                              selectedTileColor: context.theme.colorScheme.error.withOpacity(0.2),
                              selected: removeState.selections.contains(paletteIndex),
                              contentPadding: EdgeInsets.symmetric(horizontal: padding),
                              onTap: () => _onTap(context, favorites.elementAt(paletteIndex)),
                              title: Row(
                                children: List<Widget>.generate(
                                  favorites.elementAt(paletteIndex).colors.length,
                                  // ignore: prefer-extracting-callbacks, against avoid-returning-widgets rule.
                                  (int colorIndex) {
                                    final List<Color> colors = favorites.elementAt(paletteIndex).colors;
                                    final Color color = colors.elementAt(colorIndex);
                                    final Color textColor = color.contrastColor();

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
