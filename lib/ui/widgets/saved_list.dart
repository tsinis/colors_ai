import 'package:flutter/material.dart';

class SavedList extends StatelessWidget {
  const SavedList();

  @override
  Widget build(BuildContext context) => ListView.separated(
        separatorBuilder: (_, __) => const Divider(color: Colors.white),
        itemCount: item.length,
        itemBuilder: (context, listIndex) => Dismissible(
          key: Key(listIndex.toString()),
          onDismissed: (_) => print('removed'),
          background: ColoredBox(
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Icon(Icons.cancel, color: Colors.white70),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Icon(Icons.cancel, color: Colors.white70),
                )
              ],
            ),
          ),
          child: ListTile(
            tileColor: Colors.grey[600],
            enableFeedback: true,
            minVerticalPadding: 10,
            title: Row(
              children: List<Widget>.generate(
                item.elementAt(listIndex).length,
                (int childIndex) => Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Card(
                      color: item.elementAt(listIndex)[childIndex],
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

final Set<List<Color>> item = {
  [Colors.red, Colors.blueGrey, Colors.amber, Colors.green, Colors.orange],
  [Colors.deepOrange, Colors.lightBlue, Colors.lightGreen, Colors.grey, Colors.pink]
};
