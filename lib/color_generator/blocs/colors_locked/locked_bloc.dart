import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/repository/colors_repository.dart';

part 'locked_event.dart';
part 'locked_state.dart';

class LockedBloc extends Bloc<LockEvent, LockState> {
  LockedBloc(this._colorsRepository) : super(const LockSuccess());

  final ColorsRepository _colorsRepository;

  @override
  Stream<LockState> mapEventToState(LockEvent event) async* {
    if (event is LockChanged) {
      event.onlyLock ? _colorsRepository.lock(event.index) : _colorsRepository.changeLock(event.index);
    } else if (event is LockAllUnlocked) {
      _colorsRepository.unlockAll();
    }
    try {
      yield LockSuccess(lockedColors: _colorsRepository.lockedColors);
    } on Exception catch (_) {
      yield const LockFailure();
    }
  }
}
