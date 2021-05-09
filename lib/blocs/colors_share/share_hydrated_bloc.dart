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

  final ShareRepository _share = ShareRepository();

  @override
  Stream<ShareState> mapEventToState(ShareEvent event) async* {
    if (event is ShareStarted) {
      // ignore: unawaited_futures
      _share.init();
    }
    if (event is SharePdfShared) {
      await _share.asPdf(event.palette);
    }
    if (event is ShareImageShared) {
      await _share.asPng(event.palette);
    }
    if (event is ShareUrlShared) {
      _share.asUrl(event.palette);
    } else if (event is ShareUrlProviderSelected) {
      _share.providerIndex = event.providerIndex;
    } else if (event is ShareUrlCopied) {
      _share.copyUrl(event.palette);
      yield ShareCopySuccess(
        providerIndex: _share.providerIndex,
      );
    }
    try {
      yield ShareSelectedInitial(
        providerIndex: _share.providerIndex,
      );
    } on Exception catch (_) {
      yield const ShareFailure();
    }
  }

  @override
  ShareState? fromJson(Map<String, dynamic> json) {
    _share.providerIndex = json['index'] as int;
  }

  @override
  Map<String, dynamic>? toJson(ShareState state) {
    if (state is ShareSelectedInitial && state.selectedProvider != null) {
      return <String, int>{'index': state.selectedProvider!};
    }
  }
}
