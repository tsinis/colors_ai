import '../models/colors/colors_json.dart';
import '../services/api/api.dart';
import '../services/api/constants.dart';

class ColorsRepository {
  const ColorsRepository();

  static const API _apiServices = API();
  static final Set<int> _lockedColors = {};

  // ignore: prefer_const_constructors
  static ColorsAI _colorsAI = ColorsAI();

  ColorsAI get colors => _colorsAI;

  Set<int> get lockedColors => _lockedColors;

  void swapColors({required int oldIndex, required int newIndex}) {
    _colorsAI.swapColors(oldIndex: oldIndex, newIndex: newIndex);
    _lockedColors
      ..remove(oldIndex)
      ..add((newIndex >= colorsAPI.length) ? (colorsAPI.length - 1) : newIndex);
  }

  void changeLock(int colorNumber) =>
      isLockedAt(colorNumber) ? _lockedColors.remove(colorNumber) : _lockedColors.add(colorNumber);

  bool isLockedAt(int colorNumber) => _lockedColors.contains(colorNumber);

  Future<ColorsAI> get getNewColors async =>
      _colorsAI = await _apiServices.getNewColors(_colorsAI, lockedColors: _lockedColors);
}
