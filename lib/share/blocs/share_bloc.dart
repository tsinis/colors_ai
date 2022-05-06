import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../core/models/color_palette/color_palette.dart';
import '../mixins/url_providers_list.dart';
import '../models/file_format.dart';
import '../repository/share_repository.dart';
import '../services/url_providers/colors_url_provider.dart';

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
  Stream<ShareState> mapEventToState(ShareEvent event) async* {
    if (event is ShareStarted) {
      await _share.init();
    } else if (event is ShareFormatSelected) {
      _share.selectedFormat = event.format;
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
      _share.selectedUrlProvider = event.urlProvider;
    }
    try {
      yield ShareSelectedInitial(
        urlProvider: _share.selectedUrlProvider,
        fileFormat: _share.selectedFormat,
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
      return <String, String?>{
        _urlProviderKey: state.selectedProvider?.keyName,
        _formatKey: state.selectedFormat?.name,
      };
    }

    return null;
  }

  Future<void> _shareFailed() async => Future<void>.delayed(Duration.zero);
}
