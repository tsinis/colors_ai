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
    } else if (event is ShareFormatSelected) {
      _share.isLetter = event.isLetter;
    } else if (event is SharePdfShared) {
      await _share.asPdf(event.palette);
    } else if (event is ShareImageShared) {
      await _share.asPng(event.palette);
    } else if (event is ShareUrlShared) {
      _share.asUrl(event.palette);
    } else if (event is ShareUrlCopied) {
      _share.copyUrl(event.palette);
    } else if (event is ShareUrlProviderSelected) {
      _share.providerIndex = event.providerIndex;
    }
    try {
      yield ShareSelectedInitial(
        providerIndex: _share.providerIndex,
        isLetter: _share.isLetter,
      );
    } on Exception catch (_) {
      yield const ShareFailure();
    }
  }

  @override
  ShareState? fromJson(Map<String, dynamic> json) {
    final int? savedProvider = json['index'] as int?;
    final bool? savedFormat = json['isLetter'] as bool?;
    if (savedProvider != null) {
      _share.providerIndex = savedProvider;
    }
    if (savedFormat != null) {
      _share.isLetter = savedFormat;
    }
  }

  @override
  Map<String, dynamic>? toJson(ShareState state) {
    if (state is ShareSelectedInitial) {
      return <String, dynamic>{'index': state.selectedProvider, 'isLetter': state.isLetter};
    }
  }
}
