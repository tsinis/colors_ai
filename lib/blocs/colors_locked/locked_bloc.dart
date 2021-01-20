import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/colors_repository.dart';
import 'locked_event.dart';
import 'locked_state.dart';

class LockedBloc extends Bloc<LockEvent, LockedState> {
  LockedBloc(this._colorsRepository) : super(const LockState());
  final ColorsRepository _colorsRepository;

  @override
  Stream<LockedState> mapEventToState(LockEvent event) async* {
    if (event is ChangeLockEvent) {
      event.onlyLock ? _colorsRepository.lock(event.index) : _colorsRepository.changeLock(event.index);
    } else if (event is UnlockAllEvent) {
      _colorsRepository.unlockAll;
    }
    try {
      yield LockState(lockedColors: _colorsRepository.lockedColors);
      // ignore: avoid_catches_without_on_clauses
    } catch (_) {
      yield const LockedErrorState();
    }
  }
}
