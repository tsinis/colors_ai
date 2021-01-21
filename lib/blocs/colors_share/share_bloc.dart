import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../repositories/share_repository.dart';

part 'share_event.dart';
part 'share_state.dart';

// ignore_for_file: avoid_catches_without_on_clauses

class ShareBloc extends Bloc<ShareEvent, ShareState> {
  ShareBloc(this._shareRepository) : super(ShareCurrentColorsState());

  final ShareRepository _shareRepository;

  @override
  Stream<ShareState> mapEventToState(ShareEvent event) async* {
    if (event is ShareUrlEvent) {
      _shareRepository.shareUrl(event.currentColors);
    } else if (event is CopyUrlEvent) {
      _shareRepository.copyUrl(event.currentColors);
    }
    try {
      yield ShareCurrentColorsState();
    } catch (_) {
      yield const ShareErrorState();
    }
  }
}
