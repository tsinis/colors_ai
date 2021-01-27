import 'dart:ui';

import 'package:flutter/services.dart' show Clipboard, ClipboardData;
import 'package:share/share.dart';

import '../models/url_providers/url_providers.dart';
import '../services/share_web/url_provider.dart';

class ShareRepository {
  const ShareRepository({this.favoriteColors = const []});

  final List<List<Color>> favoriteColors;

  static int _selectedProvider = 0;

  // ignore: avoid_setters_without_getters
  set changeProvider(int newPoviderIndex) => _selectedProvider = newPoviderIndex;
  int get selectedProvider => _selectedProvider;

  void shareUrl(List<Color> currentColors) => _convertColorsToUrl(currentColors);
  void copyUrl(List<Color> currentColors) => _convertColorsToUrl(currentColors, copyOnly: true);

  List<ColorsUrlProvider> get providersList => const UrlProviders().list;

  Future<void> _convertColorsToUrl(List<Color> colorList, {bool copyOnly = false}) async {
    final UrlProviders urlProviders = UrlProviders(colors: colorList);
    final ColorsUrlProvider provider = urlProviders.list[_selectedProvider];

    if (copyOnly) {
      await Clipboard.setData(ClipboardData(text: provider.url));
    } else {
      await Share.share(provider.url, subject: 'Colors AI');
    }
  }
}
