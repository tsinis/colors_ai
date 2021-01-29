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
      final bool isFirstRun = await _dataStorageRepository.loadOnboardingData;
      print('FirstRun i BLOC is : $isFirstRun');
      try {
        yield isFirstRun ? const DataStorageOnboardingLoadFailure() : const DataStorageOnboardingLoadSuccess();
      } catch (_) {
        yield const DataStorageOnboardingLoadFailure();
      }
    } else if (event is DataStorageOnboardingGenFinished) {
      await _dataStorageRepository.onboardingGenerateDone;
      try {
        yield const DataStorageOnboardingLoadSuccess();
      } catch (_) {
        yield const DataStorageOnboardingLoadFailure();
      }
    }
  }
}
