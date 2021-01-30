import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/colors_generated/colors_bloc.dart';
import '../../../blocs/colors_generated/colors_event.dart';
import '../../../blocs/colors_locked/locked_bloc.dart';
import '../../../blocs/colors_locked/locked_event.dart';
import '../../../blocs/favorite_colors/favorites_bloc.dart';
import '../../../blocs/favorite_colors/favorites_event.dart';
import '../../../blocs/navigation/navigation_bloc.dart';
import '../../../extensions/color_to_hex.dart';

class FavoritesList extends StatelessWidget {
  const FavoritesList(this.favoriteColors);
  final List<List<Color>> favoriteColors;
  @override
  Widget build(BuildContext context) => Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          const Positioned(
              bottom: 20,
              child: Text(
                'Tap on the row to restore colors.\nSwipe right/left to remove them.',
                style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w300),
              )),
          ListView.separated(
            separatorBuilder: (_, __) => const Divider(height: 1.2),
            itemCount: favoriteColors.length,
            itemBuilder: (context, listIndex) => Dismissible(
              key: UniqueKey(),
              onDismissed: (_) {
                // BlocProvider.of<SoundBloc>(context)
                //     .add((direction == DismissDirection.startToEnd) ? const SoundLeftSwiped() : const SoundRightSwiped());
                BlocProvider.of<FavoritesBloc>(context).add(FavoritesOneRemoved(colorToRemoveIndex: listIndex));
              },
              secondaryBackground: const RemoveBackground(secondary: true),
              background: const RemoveBackground(),
              child: InkWell(
                onTap: () {
                  BlocProvider.of<LockedBloc>(context).add(const LockAllUnlocked());
                  BlocProvider.of<ColorsBloc>(context)
                      .add(ColorsRestored(colorsToRestore: favoriteColors.elementAt(listIndex)));

                  BlocProvider.of<NavigationBloc>(context).add(const NavigationGeneratorTabStarted());
                },
                child: ListTile(
                  tileColor: Theme.of(context).scaffoldBackgroundColor,
                  enableFeedback: true,
                  minVerticalPadding: 16,
                  title: Row(
                    children: List<Widget>.generate(
                      favoriteColors.elementAt(listIndex).length,
                      (int childIndex) {
                        final Color color = favoriteColors.elementAt(listIndex)[childIndex];
                        final Color textColor = favoriteColors.elementAt(listIndex)[childIndex].contrastColor();
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
        ],
      );
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
