import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/hive/color_palette.dart';
import '../../repositories/share_repository.dart';
import '../../services/share_web/url_provider.dart';

part 'share_event.dart';
part 'share_state.dart';

class ShareBloc extends Bloc<ShareEvent, ShareState> {
  ShareBloc(this._shareRepository)
      : super(
          ShareCurrentInitial(
            _shareRepository.selectedProvider,
            providersList: _shareRepository.providersList,
          ),
        );

  final ShareRepository _shareRepository;

  @override
  Stream<ShareState> mapEventToState(ShareEvent event) async* {
    if (event is ShareUrlShared) {
      _shareRepository.shareUrl(event.palette);
    } else if (event is ShareUrlCopied) {
      yield const ShareCopySuccess();
      _shareRepository.copyUrl(event.palette);
    } else if (event is ShareUrlProviderChanged) {
      _shareRepository.changeProvider = event.newProviderIndex;
    }
    try {
      yield ShareCurrentInitial(
        _shareRepository.selectedProvider,
        providersList: _shareRepository.providersList,
      );
    } on Exception catch (_) {
      yield const ShareFailure();
    }
  }
}
