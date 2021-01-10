import 'dart:ui';

import '../extensions/list_int_to_rgb.dart';
import '../models/colors/colors_json.dart';
import '../models/locks/locked_colors.dart';
import '../services/api/api.dart';
import '../services/api/constants.dart';

class ColorsRepository {
  const ColorsRepository();

  static const API _apiServices = API();

  // ignore: prefer_const_constructors
  static ColorsAI _colorsAI = ColorsAI();
  ColorsAI get colors => _colorsAI;

  // ignore: prefer_final_fields
  static LockedColors _locked = LockedColors();
  List<bool> get lockedColors => _locked.list;

  void changeLock(int colorIndex) => _locked.changeLock(colorIndex);

  void changeColor(Color newColor, int colorIndex) => _colorsAI.changeColor(newColor, colorIndex);

  void swapColors({required int oldIndex, required int newIndex}) {
    final int colorsAvailble = defaultColorLocks.length - 1;
    final int newIndexUngrowed = (newIndex > colorsAvailble) ? colorsAvailble : newIndex;
    _colorsAI.swapColors(oldIndex: oldIndex, newIndex: newIndexUngrowed);
    _locked.swapLocks(oldIndex: oldIndex, newIndex: newIndexUngrowed);
  }

  List<Color> get listAsColors {
    final List<Color> colorsList = [];
    for (final List<int> listInt in _colorsAI.list) {
      colorsList.add(listInt.toColor());
    }
    return colorsList;
  }

  Future<ColorsAI> get getNewColors async =>
      _colorsAI = await _apiServices.getNewColors(_colorsAI, lockedColors: _locked.list);
}
