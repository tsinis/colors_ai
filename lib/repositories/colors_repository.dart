import '../models/colors/colors_json.dart';
import '../services/api/api.dart';

class ColorsRepository {
  const ColorsRepository();

  static const API _apiServices = API();
  static final Set<int> _lockedColors = {};

  // ignore: prefer_const_constructors
  static ColorsAI _colorsAI = ColorsAI();

  ColorsAI get colors => _colorsAI;

  Set<int> get lockedColors => _lockedColors;

  void changeLock(int colorNumber) =>
      isLockedAt(colorNumber) ? _lockedColors.remove(colorNumber) : _lockedColors.add(colorNumber);

  bool isLockedAt(int colorNumber) => _lockedColors.contains(colorNumber);

  Future<ColorsAI> get getNewColors async => _colorsAI = await _apiServices.postRequest(_lockedColors);
}
