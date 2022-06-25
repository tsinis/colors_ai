import '../../core/constants.dart';
import '../models/file_format.dart';
import '../services/url_providers/colors_url_provider.dart';

part 'share_state.freezed.dart';

@freezedWithoutJson
class ShareState with _$ShareState {
  const factory ShareState.failure() = _ShareFailure;
  const factory ShareState.emptyInitial() = _ShareEmptyInitial;
  const factory ShareState.formatSelected({
    required ColorsUrlProvider? selectedProvider,
    required FileFormat? selectedFormat,
    required bool canSharePdf,
    required bool canSharePng,
  }) = _ShareFormatSelectedInitial;
}
