import 'package:equatable/equatable.dart';
import 'package:stream_bloc/stream_bloc.dart';

import '../../../core/repository/colors_repository.dart';

part 'lock_event.dart';
part 'lock_state.dart';

class LockBloc extends StreamBloc<LockEvent, LockState> {
  final ColorsRepository _colorsRepository;

  LockBloc(this._colorsRepository) : super(const LockSuccess());

  @override
  Stream<LockState> mapEventToStates(LockEvent event) async* {
    if (event is LockChanged) {
      event.onlyLock ? _colorsRepository.lock(event.index) : _colorsRepository.changeLock(event.index);
    } else if (event is LockAllUnlocked) {
      _colorsRepository.unlockAll();
    }
    yield LockSuccess(lockedColors: _colorsRepository.lockedColors);
  }
}
