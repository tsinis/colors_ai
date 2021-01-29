// ignore_for_file: import_of_legacy_library_into_null_safe, avoid_print
import 'package:hive/hive.dart';

class DataStorageRepository {
  const DataStorageRepository();

  static const String _onboardingBox = 'onboard', _isFirstGenerate = 'firstGen';

  Future<bool> get loadOnboardingData async {
    final Box onboard = await Hive.openBox<bool>(_onboardingBox);
    print('ONBOARD LOAD: $onboard');
    final dynamic isFirstRun = await onboard.get(_isFirstGenerate);
    print('FirstRun is : $isFirstRun');
    if (isFirstRun is bool) {
      return isFirstRun;
    } else {
      return true;
    }
  }

  Future<void> get onboardingGenerateDone async {
    await Hive.openBox<bool>(_onboardingBox).then((onboard) async {
      print('ONBOARD SAVE: $onboard');
      return await onboard.put(_isFirstGenerate, false);
    });
  }
}
