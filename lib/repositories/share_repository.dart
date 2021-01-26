import 'dart:ui';
import 'package:flutter/services.dart' show Clipboard, ClipboardData;
import 'package:share/share.dart';
import '../services/share_url_providers/coolors.dart';

class ShareRepository {
  const ShareRepository({this.favoriteColors = const []});

  final List<List<Color>> favoriteColors;

  void shareUrl(List<Color> currentColors) => _convertColorsToUrl(currentColors);
  void copyUrl(List<Color> currentColors) => _convertColorsToUrl(currentColors, copyOnly: true);

  Future<void> _convertColorsToUrl(List<Color> colorList, {bool copyOnly = false}) async {
    final Coolors coolors = Coolors(colorList);
    if (copyOnly) {
      await Clipboard.setData(ClipboardData(text: coolors.url));
    } else {
      await Share.share(coolors.url, subject: 'Colors AI');
    }
  }
}
