import '../models/colors/colors_json.dart';
import '../services/api/api.dart';

class ColorsRepository {
  const ColorsRepository();

  static final Set<int> _lockedColors = {};
  static const API _apiServices = API();

  Set<int> get lockedColors => _lockedColors;

  void changeLock(int colorNumber) =>
      isLockedAt(colorNumber) ? _lockedColors.remove(colorNumber) : _lockedColors.add(colorNumber);

  bool isLockedAt(int colorNumber) => _lockedColors.contains(colorNumber);

  Future<ColorsAI> get getNewColors async => await _apiServices.postRequest(_lockedColors);
}
