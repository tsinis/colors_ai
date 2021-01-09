import 'package:flutter/cupertino.dart';

class SavedColors {
  const SavedColors(this._list);
  final Set<List<Color>> _list;
  Set<List<Color>> get list => _list;
  // void getColorAt(int index) => _list.elementAt(index);
  void add(List<Color> color) => _list.add(color);
}
