import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/colors_generated/colors_bloc.dart';
import '../../../blocs/colors_locked/locked_bloc.dart';
import '../../../blocs/favorite_colors/favorites_bloc.dart';
import '../../../blocs/favorite_colors/favorites_event.dart';
import '../../../blocs/navigation/navigation_bloc.dart';
import '../../../extensions/color_to_hex.dart';
import '../../../models/hive/color_palette.dart';

class FavoritesList extends StatefulWidget {
  const FavoritesList(this._favorites);
  final List<ColorPalette> _favorites;

  @override
  _FavoritesListState createState() => _FavoritesListState();
}

class _FavoritesListState extends State<FavoritesList> {
  bool isDissmised = true;

  @override
  Widget build(BuildContext context) {
    isDissmised = true;
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        const Positioned(
            bottom: 20,
            child: Text(
              'Tap on the row to restore colors.\nSwipe right/left to remove them.',
              style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w300),
            )),
        ListView.builder(
          itemCount: widget._favorites.length,
          itemBuilder: (_, paletteIndex) => Dismissible(
            key: UniqueKey(),
            onResize: () {
              if (isDissmised) {
                BlocProvider.of<FavoritesBloc>(context).add(FavoritesOneRemoved(colorToRemoveIndex: paletteIndex));
              }
              isDissmised = false;
            },
            onDismissed: (_) => setState(() => isDissmised = true),
            secondaryBackground: const RemoveBackground(secondary: true),
            background: const RemoveBackground(),
            child: InkWell(
              onTap: () {
                BlocProvider.of<LockedBloc>(context).add(const LockAllUnlocked());
                BlocProvider.of<ColorsBloc>(context)
                    .add(ColorsRestored(palette: widget._favorites.elementAt(paletteIndex)));
                BlocProvider.of<NavigationBloc>(context).add(const NavigationGeneratorTabStarted());
              },
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Theme.of(context).scaffoldBackgroundColor, Colors.grey],
                      begin: const Alignment(0, -0.94),
                      end: const Alignment(0, -1)),
                ),
                child: ListTile(
                  enableFeedback: true,
                  minVerticalPadding: 16,
                  title: Row(
                    children: List<Widget>.generate(
                      widget._favorites.elementAt(paletteIndex).colors.length,
                      (int colorIndex) {
                        final Color color = widget._favorites.elementAt(paletteIndex).colors[colorIndex];
                        final Color textColor =
                            widget._favorites.elementAt(paletteIndex).colors[colorIndex].contrastColor();
                        return Expanded(
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Card(
                              color: color,
                              child: Center(
                                child: Text(color.toHex(),
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: textColor, fontSize: 11)),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class RemoveBackground extends StatelessWidget {
  const RemoveBackground({this.secondary = false});
  final bool secondary;

  @override
  Widget build(BuildContext context) => ColoredBox(
        color: Theme.of(context).errorColor,
        child: Align(
          alignment: secondary ? Alignment.centerRight : Alignment.centerLeft,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Icon(Icons.delete_forever, color: Colors.white70),
          ),
        ),
      );
}
