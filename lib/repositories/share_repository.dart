import 'dart:ui' show Color;

import 'package:share/share.dart';

import '../models/hive/color_palette.dart';
import '../models/url_providers/url_providers.dart';
import '../services/clipboard/clipboard.dart';
import '../services/share_web/url_provider.dart';

class ShareRepository {
  const ShareRepository({this.favoriteColors = const []});

  final List<List<Color>> favoriteColors;

  static const Clipboards _clipboard = Clipboards();
  static int _selectedProvider = 0;

  // ignore: avoid_setters_without_getters
  set changeProvider(int newPoviderIndex) => _selectedProvider = newPoviderIndex;
  int get selectedProvider => _selectedProvider;

  void shareUrl(ColorPalette palette) => _convertColorsToUrl(palette);
  void copyUrl(ColorPalette palette) => _convertColorsToUrl(palette, copyOnly: true);

  List<ColorsUrlProvider> get providersList => const UrlProviders(palette: ColorPalette()).list;

  Future<void> _convertColorsToUrl(ColorPalette colors, {bool copyOnly = false}) async {
    final UrlProviders urlProviders = UrlProviders(palette: colors);
    final ColorsUrlProvider provider = urlProviders.list[_selectedProvider];

    if (copyOnly) {
      await _clipboard.copyURL(provider.url);
    } else {
      await Share.share(provider.url, subject: 'Colors AI');
    }
  }
}
