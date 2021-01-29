// ignore_for_file: import_of_legacy_library_into_null_safe, avoid_print
import 'package:hive/hive.dart';

class DataStorageRepository {
  const DataStorageRepository();

  static const String _onboardingBox = 'onboard', _isFirstGenerate = 'firstGen', _isFirstFavorite = 'firstFav';

  Future<bool> loadOnboardingData({bool forFavorites = false}) async {
    final Box onboard = await Hive.openBox<bool>(_onboardingBox);
    final dynamic isFirstRun = await onboard.get(forFavorites ? _isFirstFavorite : _isFirstGenerate);
    if (isFirstRun is bool) {
      return isFirstRun;
    } else {
      return true;
    }
  }

  Future<void> onboardingDone({bool forFavorites = false}) async {
    await Hive.openBox<bool>(_onboardingBox)
        .then((onboard) async => await onboard.put(forFavorites ? _isFirstFavorite : _isFirstGenerate, false));
  }
}
