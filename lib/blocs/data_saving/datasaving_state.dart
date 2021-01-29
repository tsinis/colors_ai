part of 'datasaving_bloc.dart';

abstract class DataStorageState extends Equatable {
  const DataStorageState();

  @override
  List<Object> get props => [];
}

class DataStorageInitial extends DataStorageState {
  const DataStorageInitial();
}

class DataStorageOnboardingLoadInProgress extends DataStorageState {
  const DataStorageOnboardingLoadInProgress();
}

class DataStorageOnboardingLoadFailure extends DataStorageState {
  const DataStorageOnboardingLoadFailure();
}

class DataStorageGenerateLoadSuccess extends DataStorageState {
  const DataStorageGenerateLoadSuccess();
}

class DataStorageFavsBoardingLoadSuccess extends DataStorageState {
  const DataStorageFavsBoardingLoadSuccess();
}

class DataStorageOnboardingLoadSuccess extends DataStorageState {
  const DataStorageOnboardingLoadSuccess();
}
