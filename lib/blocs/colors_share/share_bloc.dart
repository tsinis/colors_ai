import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/share_repository.dart';
import '../../services/share_web/url_provider.dart';

part 'share_event.dart';
part 'share_state.dart';

// ignore_for_file: avoid_catches_without_on_clauses

class ShareBloc extends Bloc<ShareEvent, ShareState> {
  ShareBloc(this._shareRepository)
      : super(ShareCurrentInitial(
          _shareRepository.selectedProvider,
          providersList: _shareRepository.providersList,
        ));

  final ShareRepository _shareRepository;

  @override
  Stream<ShareState> mapEventToState(ShareEvent event) async* {
    if (event is ShareUrlCShared) {
      _shareRepository.shareUrl(event.currentColors);
    } else if (event is ShareUrlCopied) {
      _shareRepository.copyUrl(event.currentColors);
    } else if (event is ShareUrlProviderChanged) {
      _shareRepository.changeProvider = event.newProviderIndex;
    }
    try {
      yield ShareCurrentInitial(
        _shareRepository.selectedProvider,
        providersList: _shareRepository.providersList,
      );
    } catch (_) {
      yield const ShareFailure();
    }
  }
}
