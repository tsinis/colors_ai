// ignore_for_file: avoid_catches_without_on_clauses

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/local_storage_repository.dart';

part 'datasaving_event.dart';
part 'datasaving_state.dart';

class DataStorageBloc extends Bloc<DataStorageEvent, DataStorageState> {
  DataStorageBloc() : super(const DataStorageInitial());

  static const DataStorageRepository _dataStorageRepository = DataStorageRepository();

  @override
  Stream<DataStorageState> mapEventToState(DataStorageEvent event) async* {
    if (event is DataStorageOnboardingStarted) {
      yield const DataStorageOnboardingLoadInProgress();
      final bool isFirstGenerate = await _dataStorageRepository.loadOnboardingData();
      try {
        yield isFirstGenerate ? const DataStorageOnboardingLoadFailure() : const DataStorageGenerateLoadSuccess();
      } catch (_) {
        yield const DataStorageOnboardingLoadFailure();
      }
      if (!isFirstGenerate) {
        final bool isFirstFavorite = await _dataStorageRepository.loadOnboardingData(forFavorites: true);
        try {
          yield isFirstFavorite ? const DataStorageGenerateLoadSuccess() : const DataStorageOnboardingLoadSuccess();
        } catch (_) {
          yield const DataStorageOnboardingLoadFailure();
        }
      }
    } else if (event is DataStorageOnboardingGenFinished) {
      await _dataStorageRepository.onboardingDone();
      try {
        yield const DataStorageGenerateLoadSuccess();
      } catch (_) {
        yield const DataStorageOnboardingLoadFailure();
      }
    } else if (event is DataStorageOnboardingFavsFinished) {
      await _dataStorageRepository.onboardingDone(forFavorites: true);
      try {
        yield const DataStorageFavsBoardingLoadSuccess();
      } catch (_) {
        yield const DataStorageOnboardingLoadFailure();
      }
    }
  }
}
