import 'dart:ui';

import 'package:flutter/services.dart' show Clipboard, ClipboardData;
import 'package:share/share.dart';
import '../services/share_web/providers_list.dart';

class ShareRepository {
  const ShareRepository({this.favoriteColors = const []});

  final List<List<Color>> favoriteColors;

  void shareUrl(List<Color> currentColors) => _convertColorsToUrl(currentColors);
  void copyUrl(List<Color> currentColors) => _convertColorsToUrl(currentColors, copyOnly: true);

  Future<void> _convertColorsToUrl(List<Color> colorList, {bool copyOnly = false}) async {
    // final Coolors colors = Coolors(colorList);
    // final MuzliColors colors = MuzliColors(colorList);
    // final ColorDesigner colors = ColorDesigner(colorList);
    // final Palettable colors = Palettable(colorList);
    // final GoogleArt colors = GoogleArt(colorList);
    // final Poolors colors = Poolors(colorList);
    final Colordot colors = Colordot(colorList);

    if (copyOnly) {
      await Clipboard.setData(ClipboardData(text: colors.url));
    } else {
      await Share.share(colors.url, subject: 'Colors AI');
    }
  }
}
