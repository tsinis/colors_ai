import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../../../core/interfaces/storage_interfaces/hive_storage_interface.dart';

class OnboardingHiveStorage extends HiveStorageInterface<bool> {
  final String _isFirstRunKey;

  Future<bool> get loadValue async {
    final Box<bool> onboardBox = await openBox;
    try {
      final bool? isFirstRun = onboardBox.get(_isFirstRunKey, defaultValue: true);

      return !(isFirstRun == false);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      debugPrint('Exception during onboarding box opening: $e');

      return false;
    } finally {
      await onboardBox.close();
    }
  }

  const OnboardingHiveStorage({
    HiveCipher? encryption,
    String boxName = 'onboard',
    String isFirstRunKey = 'firstRun',
    Box<bool>? openedBox,
  })  : _isFirstRunKey = isFirstRunKey,
        super(encryption, boxName: boxName, openedBox: openedBox);

  Future<void> saveNewValue({required bool isFirstRun}) async {
    final Box<bool> storageBox = await openBox;
    await storageBox.put(_isFirstRunKey, isFirstRun);
    await storageBox.close();
  }

  @override
  Future<void> doMigration(covariant bool? oldData) async {
    if (oldData == null) {
      return;
    }
    final Box<bool> storageBox = await openBox;
    await storageBox.put(_isFirstRunKey, oldData);
  }
}
