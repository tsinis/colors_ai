import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/colors_repository.dart';
import 'locked_event.dart';
import 'locked_state.dart';

// ignore_for_file: avoid_catches_without_on_clauses

class LockedBloc extends Bloc<LockEvent, LockedState> {
  LockedBloc(this._colorsRepository) : super(const LockState({}));
  final ColorsRepository _colorsRepository;

  @override
  Stream<LockedState> mapEventToState(LockEvent event) async* {
    if (event is ChangeLockEvent) {
      _colorsRepository.changeLock(event.index);
      try {
        yield LockState(_colorsRepository.lockedColors);
      } catch (_) {
        yield const LockedErrorState();
      }
    }
  }
}
