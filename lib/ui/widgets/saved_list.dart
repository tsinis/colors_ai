import 'package:flutter/material.dart';

class SavedList extends StatelessWidget {
  const SavedList({this.savedColors = const {}});
  final Set<List<Color>> savedColors;
  @override
  Widget build(BuildContext context) => ListView.builder(
        // separatorBuilder: (_, __) => const Divider(color: Colors.white),
        itemCount: savedColors.length,
        itemBuilder: (context, listIndex) => Dismissible(
          //TODO Create custom widget with swipe right to move back.
          direction: DismissDirection.endToStart,
          key: Key(listIndex.toString()),
          onDismissed: (_) => print('removed'),
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
                (int childIndex) => Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Card(
                      color: savedColors.elementAt(listIndex)[childIndex],
                      elevation: 6,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
