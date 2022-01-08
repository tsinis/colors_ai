import '../services/storage_providers/onboarding_hive_storage.dart';

class OnboardingRepository {
  final OnboardingHiveStorage _storage;

  Future<bool> get loadOnboardData => _storage.loadValue;

  const OnboardingRepository(OnboardingHiveStorage storage) : _storage = storage;

  Future<void> onboardingDone() => _storage.saveNewValue(isFirstRun: false);
}
