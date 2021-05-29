import 'dart:io' show File;
import 'dart:typed_data' show Uint8List;

import 'package:flutter/foundation.dart' show debugPrint;
import 'package:printing/printing.dart';
import 'package:share/share.dart';

import '../../general/models/color_palette/color_palette.dart';
import '../../general/services/clipboard.dart';
import '../mixins/device_capabilities.dart';
import '../mixins/file_creator.dart';
import '../services/url_providers/url_providers.dart';

class ShareRepository with FileCreator, DeviceCapabilities {
  static const List<ColorsUrlProvider> providers = [
    ArtsGoogle(),
    CohesiveColors(),
    ColorCombos(),
    ColorDesigner(),
    Colordot(),
    Coolors(),
    MuzliColors(),
    Palettable(),
    Poolors(),
  ];

  static const Clipboards _clipboard = Clipboards();
  static const String _subject = 'Colors AI';

  bool? _isLetter;
  int? _providerIndex;

  bool? get isLetter => _isLetter;

  set isLetter(bool? isLetter) {
    if (isLetter != null && isLetter != _isLetter) {
      _isLetter = isLetter;
    }
  }

  int? get providerIndex => _providerIndex;

  set providerIndex(int? newProviderIndex) {
    if (newProviderIndex != null && newProviderIndex != _providerIndex) {
      _providerIndex = newProviderIndex;
    }
  }

  void asUrl(ColorPalette palette) => _convertColorsToUrl(palette);

  void copyUrl(ColorPalette palette) => _convertColorsToUrl(palette, copyOnly: true);

  Future<void> asPdf(ColorPalette pallete) async => _shareFile(await generateFile(pallete));

  Future<bool> asPng(ColorPalette pallete) async {
    //TODO! Add try/catch in bloc and show error in UI.
    bool canShare = true;
    await Printing.raster(await generateFile(pallete)).forEach((page) async {
      try {
        canShare = await _shareFile(await page.toPng(), isPdf: false);
      } on Exception catch (e) {
        debugPrint('Cannot create PNG, error :$e');
        canShare = false;
      }
    });
    return canShare;
  }

  Future<bool> _shareFile(Uint8List bytes, {bool isPdf = true}) async {
    final String fileExtension = isPdf ? 'pdf' : 'png';
    final String filePath = '$storagePath/colors_ai.$fileExtension';
    final File file = File(filePath)..writeAsBytesSync(bytes.toList());
    if (file.existsSync()) {
      await Share.shareFiles([filePath], subject: _subject);
      return true;
    } else {
      return false;
    }
  }

  Future<void> _convertColorsToUrl(ColorPalette palette, {bool copyOnly = false}) async {
    final ColorsUrlProvider provider = providers[providerIndex ?? 0];
    final String url = provider.url(palette);
    copyOnly ? await _clipboard.copyUrl(url) : await Share.share(url, subject: _subject);
  }
}
