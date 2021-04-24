import 'package:share/share.dart';

import '../models/hive/color_palette.dart';
import '../models/url_providers/url_providers.dart';
import '../services/clipboard/clipboard.dart';

class ShareRepository {
  const ShareRepository(
      {this.providers = const [
        ArtsGoogle(),
        Coolors(),
        MuzliColors(),
        Palettable(),
      ]});

  final List<ColorsUrlProvider> providers;

  static const Clipboards _clipboard = Clipboards();
  static int _providerIndex = 0;

  // ignore: avoid_setters_without_getters
  set changeProvider(int newPoviderIndex) => _providerIndex = newPoviderIndex;
  int get selectedProvider => _providerIndex;

  void shareUrl(ColorPalette palette) => _convertColorsToUrl(palette);
  void copyUrl(ColorPalette palette) => _convertColorsToUrl(palette, copyOnly: true);

  Future<void> _convertColorsToUrl(ColorPalette palette, {bool copyOnly = false}) async {
    final ColorsUrlProvider provider = providers[_providerIndex];
    final String url = provider.url(palette);
    copyOnly ? await _clipboard.copyURL(url) : await Share.share(url, subject: 'Colors AI');
  }
}
