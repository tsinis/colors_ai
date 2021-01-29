part of 'datasaving_bloc.dart';

abstract class DataStorageEvent extends Equatable {
  const DataStorageEvent();

  @override
  List<Object> get props => [];
}

class DataStorageOnboardingStarted extends DataStorageEvent {
  const DataStorageOnboardingStarted();
}

class DataStorageOnboardingGenFinished extends DataStorageEvent {
  const DataStorageOnboardingGenFinished();
}
