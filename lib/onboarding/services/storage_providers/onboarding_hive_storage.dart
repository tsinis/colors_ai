import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../../../core/interfaces/storage_interfaces/hive_storage_interface.dart';

class OnboardingHiveStorage extends HiveStorageInterface<bool> {
  final String _isFirstRunKey;

  String get isFirstRunKey => _isFirstRunKey;

  Future<bool> get loadOnboardData async {
    final Box<bool> onboardBox = await openBox;
    try {
      final bool? isFirstRun = onboardBox.get(isFirstRunKey, defaultValue: true);

      return !(isFirstRun == false);
    } on Exception catch (e) {
      debugPrint('Exception during onboarding box opening: $e');

      return true;
    } finally {
      await onboardBox.close();
    }
  }

  const OnboardingHiveStorage({HiveCipher? encryption, String boxName = 'onboard', String isFirstRunKey = 'firstRun'})
      : _isFirstRunKey = isFirstRunKey,
        super(encryption, boxName: boxName);

  @override
  Future<void> doMigration(covariant bool oldData) async {
    final Box<bool> storageBox = await openBox;
    await storageBox.put(isFirstRunKey, oldData);
  }
}
