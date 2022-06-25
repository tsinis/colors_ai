import '../../core/constants.dart';
import '../../core/models/color_palette/color_palette.dart';
import '../models/file_format.dart';
import '../services/url_providers/colors_url_provider.dart';

part 'share_event.freezed.dart';

@freezedWithoutJson
class ShareEvent with _$ShareEvent {
  const factory ShareEvent.started() = _ShareStarted;
  const factory ShareEvent.urlShared(ColorPalette palette) = _ShareUrlShared;
  const factory ShareEvent.urlCopied(ColorPalette palette) = _ShareUrlCopied;
  const factory ShareEvent.fileShared(ColorPalette palette) = _ShareFileShared;
  const factory ShareEvent.fileCopied(ColorPalette palette) = _ShareFileCopied;
  const factory ShareEvent.formatSelected({required FileFormat? format}) = _ShareFormatSelected;
  const factory ShareEvent.urlProviderSelected({required ColorsUrlProvider? urlProvider}) = _ShareUrlProviderSelected;
}
