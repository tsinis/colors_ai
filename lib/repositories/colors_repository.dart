import 'dart:ui';

import '../models/colors/colors_json.dart';
import '../services/api/api.dart';
import '../services/api/constants.dart';

class ColorsRepository {
  const ColorsRepository();

  static const API _apiServices = API();
  //TODO! Change to List.
  static final Set<int> _lockedColors = {};

  // ignore: prefer_const_constructors
  static ColorsAI _colorsAI = ColorsAI();

  ColorsAI get colors => _colorsAI;

  void changeColor(Color newColor, int colorIndex) => _colorsAI.changeColor(newColor, colorIndex);

  Set<int> get lockedColors => _lockedColors;

  void swapColors({required int oldIndex, required int newIndex}) {
    final int colorsAvailble = colorsAPI.length - 1;
    final int newIndexUngrowed = (newIndex > colorsAvailble) ? colorsAvailble : newIndex;
    _colorsAI.swapColors(oldIndex: oldIndex, newIndex: newIndexUngrowed);
  }

  void changeLock(int colorNumber) =>
      isLockedAt(colorNumber) ? _lockedColors.remove(colorNumber) : _lockedColors.add(colorNumber);

  bool isLockedAt(int colorNumber) => _lockedColors.contains(colorNumber);

  Future<ColorsAI> get getNewColors async =>
      _colorsAI = await _apiServices.getNewColors(_colorsAI, lockedColors: _lockedColors);
}
