import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../core/models/color_palette/color_palette.dart';
import '../../repository/share_repository.dart';
import '../../services/url_providers/colors_url_provider.dart';

part 'share_event.dart';
part 'share_state.dart';

class ShareBloc extends HydratedBloc<ShareEvent, ShareState> {
  final ShareRepository _share;
  final String _urlProviderKey;
  final String _formatKey;

  ShareBloc(this._share, {String urlProviderKey = 'url', String formatKey = 'format'})
      : _formatKey = formatKey,
        _urlProviderKey = urlProviderKey,
        super(const ShareEmptyInitial());

  @override
  ShareState? fromJson(Map<String, dynamic> json) {
    final int? savedProvider = json[_urlProviderKey] as int?;
    final int? savedFormat = json[_formatKey] as int?;
    if (savedProvider != null) {
      _share.providerIndex = savedProvider;
    }
    if (savedFormat != null) {
      _share.formatIndex = savedFormat;
    }
  }

  @override
  Stream<ShareState> mapEventToState(ShareEvent event) async* {
    if (event is ShareStarted) {
      await _share.init();
    } else if (event is ShareFormatSelected) {
      _share.formatIndex = event.formatIndex;
    } else if (event is ShareFileShared) {
      try {
        await _share.asFile(event.palette);
        // ignore: avoid_catches_without_on_clauses
      } catch (_) {
        yield const ShareFailure();
        await _shareFailed();
      }
    } else if (event is ShareFileCopied) {
      try {
        await _share.copyFile(event.palette);
        // ignore: avoid_catches_without_on_clauses
      } catch (_) {
        yield const ShareFailure();
        await _shareFailed();
      }
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
        formatIndex: _share.formatIndex,
        canSharePdf: _share.canSharePdf,
        canSharePng: _share.canSharePng,
      );
    } on Exception catch (_) {
      yield const ShareFailure();
      await _shareFailed();
    }
  }

  @override
  Map<String, dynamic>? toJson(ShareState state) {
    if (state is ShareSelectedInitial) {
      return <String, dynamic>{_urlProviderKey: state.selectedProvider, _formatKey: state.selectedFormat};
    }
  }

  Future<void> _shareFailed() async => Future.delayed(Duration.zero);
}