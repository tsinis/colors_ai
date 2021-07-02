import 'dart:io' show File;
import 'dart:typed_data' show Uint8List;

import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';

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
    MakeTintsAndShades(),
    MuzliColors(),
    Palettable(),
    PalleteNinja(),
    Poolors(),
    SessionsCollege()
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

  Future<void> asPdf(ColorPalette pallete) async {
    try {
      await _shareFile(await generateFile(pallete));
      // ignore: avoid_catches_without_on_clauses
    } catch (_) {
      rethrow;
    }
  }

  Future<void> asPng(ColorPalette pallete) async {
    await Printing.raster(await generateFile(pallete)).forEach((page) async {
      try {
        await _shareFile(await page.toPng(), isPdf: false);
        // ignore: avoid_catches_without_on_clauses
      } catch (_) {
        rethrow;
      }
    });
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
