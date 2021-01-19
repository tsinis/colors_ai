import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/colors_saved/saved_bloc.dart';
import '../../blocs/colors_saved/saved_event.dart';
import '../../extensions/color_to_hex.dart';

class SavedList extends StatelessWidget {
  const SavedList(this.savedColors);
  final List<List<Color>> savedColors;
  @override
  Widget build(BuildContext context) => ListView.separated(
        separatorBuilder: (_, __) => const Divider(height: 1.2),
        itemCount: savedColors.length,
        itemBuilder: (context, listIndex) => Dismissible(
          key: UniqueKey(),
          onDismissed: (_) => BlocProvider.of<SavedBloc>(context).add(SavedRemoveEvent(colorToRemoveIndex: listIndex)),
          secondaryBackground: const RemoveBackground(secondary: true),
          background: const RemoveBackground(),
          child: ListTile(
            tileColor: Colors.grey[600],
            enableFeedback: true,
            minVerticalPadding: 16,
            title: Row(
              children: List<Widget>.generate(
                savedColors.elementAt(listIndex).length,
                (int childIndex) {
                  final Color color = savedColors.elementAt(listIndex)[childIndex];
                  final Color textColor = savedColors.elementAt(listIndex)[childIndex].contrastColor();
                  return Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Card(
                        color: color,
                        child: Center(
                          child: Text(color.toHex(),
                              maxLines: 2, textAlign: TextAlign.center, style: TextStyle(color: textColor)),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );
}

class RemoveBackground extends StatelessWidget {
  const RemoveBackground({this.secondary = false});
  final bool secondary;
  @override
  Widget build(BuildContext context) => ColoredBox(
        color: Colors.red,
        child: Align(
          alignment: secondary ? Alignment.centerRight : Alignment.centerLeft,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Icon(Icons.delete_forever, color: Colors.white70),
          ),
        ),
      );
}
