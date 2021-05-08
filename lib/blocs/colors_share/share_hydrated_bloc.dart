import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../models/hive/color_palette.dart';
import '../../models/url_providers/url_providers.dart';
import '../../repositories/share_repository.dart';

part 'share_event.dart';
part 'share_state.dart';

class ShareBloc extends HydratedBloc<ShareEvent, ShareState> {
  ShareBloc() : super(const ShareEmptyInitial());

  final ShareRepository _shareRepository = ShareRepository();

  @override
  Stream<ShareState> mapEventToState(ShareEvent event) async* {
    if (event is ShareUrlShared) {
      _shareRepository.shareUrl(event.palette);
    } else if (event is ShareUrlCopied) {
      _shareRepository.copyUrl(event.palette);
      yield ShareCopySuccess(
        _shareRepository.providers,
        providerIndex: _shareRepository.providerIndex,
      );
    } else if (event is ShareUrlProviderSelected && event.providerIndex != null) {
      _shareRepository.providerIndex = event.providerIndex;
    }
    try {
      yield ShareSelectedInitial(
        _shareRepository.providers,
        providerIndex: _shareRepository.providerIndex,
      );
    } on Exception catch (_) {
      yield const ShareFailure();
    }
  }

  @override
  ShareState? fromJson(Map<String, dynamic> json) {
    _shareRepository.providerIndex = json['index'] as int;
    return ShareSelectedInitial(
      _shareRepository.providers,
      providerIndex: _shareRepository.providerIndex,
    );
  }

  @override
  Map<String, int>? toJson(ShareState state) {
    if (state is ShareSelectedInitial && state.selectedProvider != null) {
      return {'index': state.selectedProvider!};
    }
  }
}
