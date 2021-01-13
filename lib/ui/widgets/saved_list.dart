import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/colors_saved/saved_bloc.dart';
import '../../blocs/colors_saved/saved_event.dart';
import '../../extensions/color_to_hex.dart';
import 'customized_default_widgets/swipe_back_dissmissible.dart';

class SavedList extends StatelessWidget {
  const SavedList({required this.moveBack, this.savedColors = const []});
  final List<List<Color>> savedColors;
  final Function() moveBack;
  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: savedColors.length,
        itemBuilder: (context, listIndex) => SwipeBackDismissible(
          direction: CustomDismissDirection.endToStart,
          key: UniqueKey(),
          onSwipeBack: moveBack,
          onDismissed: (_) =>
              BlocProvider.of<SavedBloc>(context).add(SavedRemovingEvent(colorToRemoveIndex: listIndex)),
          background: const ColoredBox(
            color: Colors.red,
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Icon(Icons.delete_forever, color: Colors.white70),
              ),
            ),
          ),
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
