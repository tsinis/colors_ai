import 'dart:ui';

class SavedColorsRepository {
  const SavedColorsRepository();
  // ignore: prefer_final_fields
  static List<List<Color>> _list = [];
  List<List<Color>> get list => _list;
  // void getColorAt(int index) => _list.elementAt(index);
  void add(List<Color> color) => _list.add(color);
  void remove(int colorIndex) => _list.removeAt(colorIndex);
  void get removeAll => _list.clear();
}
