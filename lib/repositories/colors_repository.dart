import 'dart:ui' show Color;

import '../extensions/color_to_list_int.dart';
import '../extensions/list_color_to_palette.dart';
import '../extensions/list_int_to_color.dart';
import '../models/colors/colors_json.dart';
import '../models/colors/constants.dart';
import '../models/hive/color_palette.dart';
import '../models/locks/locked_colors.dart';
import '../services/api/api.dart';
import '../services/api/constants.dart';

class ColorsRepository {
  const ColorsRepository();

  static const API _apiServices = API();

  // ignore: prefer_final_fields
  static LockedColors _locked = LockedColors();

  List<bool> get lockedColors => _locked.list;
  void unlockAll() => _locked.unlockAll();
  void changeLock(int colorIndex) => _locked.changeLock(colorIndex);
  void lock(int colorIndex) => _locked.lock(colorIndex);

  // ignore: prefer_const_constructors
  static ColorsAI _colorsAI = ColorsAI();

  ColorsAI get colors => _colorsAI;

  void changeColor(Color newColor, int colorIndex) => _colorsAI.changeColor(newColor, colorIndex);

  void swapColors({required int oldIndex, required int newIndex}) {
    final int colorsAvailble = defaultColorLocks.length - 1;
    // List can be temporary growable, in some cases, for example on long drag at the last tile.
    final int newIndexUngrowed = (newIndex > colorsAvailble) ? colorsAvailble : newIndex;
    _colorsAI.swapColors(oldIndex: oldIndex, newIndex: newIndexUngrowed);
    _locked.swapLocks(oldIndex: oldIndex, newIndex: newIndexUngrowed);
  }

  ColorPalette get asPalette {
    final List<Color> colorsList = [];
    for (final List<int> listInt in _colorsAI.list) {
      colorsList.add(listInt.toColor());
    }
    return colorsList.toPalette();
  }

  void initColors() {
    final List<List<int>> colorsIntList = [];
    for (final Color color in defaultColors) {
      colorsIntList.add(color.toListInt());
    }
    _colorsAI = ColorsAI(list: colorsIntList);
  }

  void fromFavorites(ColorPalette palette) {
    final List<List<int>> colorsIntList = [];
    for (final Color color in palette.colors) {
      colorsIntList.add(color.toListInt());
    }
    _colorsAI = ColorsAI(list: colorsIntList);
  }

  Future<bool> get getNewColors async {
    if (_locked.list.contains(false)) {
      try {
        _colorsAI = await _apiServices.getNewColors(_colorsAI, lockedColors: _locked.list);
        return true;
      } on Exception catch (_) {
        return false;
      }
    } else {
      return true;
    }
  }
}
