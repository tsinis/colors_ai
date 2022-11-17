import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../models/file_format.dart';
import '../repository/share_repository.dart';
import '../services/url_providers/colors_url_provider.dart';
import 'share_event.dart';
import 'share_state.dart';

export 'share_event.dart';
export 'share_state.dart';

class ShareBloc extends HydratedBloc<ShareEvent, ShareState> {
  final ShareRepository _share;
  final String _urlProviderKey;
  final String _formatKey;

  ShareBloc(this._share, {String urlProviderKey = 'url', String formatKey = 'format'})
      : _formatKey = formatKey,
        _urlProviderKey = urlProviderKey,
        super(const ShareState.emptyInitial()) {
    on<ShareEvent>(_onEvent);
  }

  @override
  ShareState? fromJson(Map<String, dynamic> json) {
    final String? savedProvider = json[_urlProviderKey] as String?;
    final String? savedFormat = json[_formatKey] as String?;
    if (savedProvider != null) {
      _share.restoreUrlProviderFromJson(savedProvider);
    }
    if (savedFormat != null) {
      _share.restoreFormatFromJson(savedFormat);
    }

    return null;
  }

  @override
  Map<String, dynamic>? toJson(ShareState state) => state.whenOrNull(
        formatSelected: (ColorsUrlProvider? provider, FileFormat? format, _, __) => <String, String?>{
          _urlProviderKey: provider?.keyName,
          _formatKey: format?.name,
        },
      );

  Future<void> _onEvent(ShareEvent event, Emitter<ShareState> emit) async {
    await event.whenOrNull(started: () async => _share.init());
    try {
      event.whenOrNull(
        urlShared: _share.asUrl,
        urlCopied: _share.copyUrl,
        fileShared: _share.asFile,
        fileCopied: _share.copyFile,
        formatSelected: (FileFormat? format) => _share.selectedFormat = format,
        urlProviderSelected: (ColorsUrlProvider? provider) => _share.selectedUrlProvider = provider,
      );
    } catch (_) {
      emit(const ShareState.failure());
      await Future<void>.delayed(Duration.zero);
    }
    emit(
      ShareState.formatSelected(
        selectedProvider: _share.selectedUrlProvider,
        selectedFormat: _share.selectedFormat,
        canSharePdf: _share.canSharePdf,
        canSharePng: _share.canSharePng,
      ),
    );
  }
}
