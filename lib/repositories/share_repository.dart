import 'package:share/share.dart';

import '../models/hive/color_palette.dart';
import '../models/url_providers/url_providers.dart';
import '../services/clipboard.dart';

class ShareRepository {
  ShareRepository(
      {this.providers = const [
        ArtsGoogle(),
        ColorCombos(),
        ColorDesigner(),
        Colordot(),
        Coolors(),
        MuzliColors(),
        Palettable(),
        Poolors(),
      ]});

  final List<ColorsUrlProvider> providers;

  static const Clipboards _clipboard = Clipboards();

  int? providerIndex;

  void shareUrl(ColorPalette palette) => _convertColorsToUrl(palette);
  void copyUrl(ColorPalette palette) => _convertColorsToUrl(palette, copyOnly: true);

  Future<void> _convertColorsToUrl(ColorPalette palette, {bool copyOnly = false}) async {
    final ColorsUrlProvider provider = providers[providerIndex ?? 0];
    final String url = provider.url(palette);
    copyOnly ? await _clipboard.copyURL(url) : await Share.share(url, subject: 'Colors AI');
  }
}
