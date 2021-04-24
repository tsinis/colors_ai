import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/hive/color_palette.dart';
import '../../models/url_providers/url_providers.dart';
import '../../repositories/share_repository.dart';

part 'share_event.dart';
part 'share_state.dart';

class ShareBloc extends Bloc<ShareEvent, ShareState> {
  ShareBloc() : super(const ShareEmptyInitial());

  static const ShareRepository _shareRepository = ShareRepository();

  @override
  Stream<ShareState> mapEventToState(ShareEvent event) async* {
    if (event is ShareUrlShared) {
      _shareRepository.shareUrl(event.palette);
    } else if (event is ShareUrlCopied) {
      yield const ShareCopySuccess();
      _shareRepository.copyUrl(event.palette);
    } else if (event is ShareUrlProviderSelected) {
      _shareRepository.changeProvider = event.providerIndex;
    }
    try {
      yield ShareCurrentInitial(
        _shareRepository.selectedProvider,
        providersList: _shareRepository.providers,
      );
    } on Exception catch (_) {
      yield const ShareFailure();
    }
  }
}
