import 'dart:io' show File;
import 'dart:typed_data' show Uint8List;

import 'package:flutter/foundation.dart' show debugPrint;
import 'package:printing/printing.dart';
import 'package:share/share.dart';

import '../mixins/file_creator.dart';
import '../models/hive/color_palette.dart';
import '../models/url_providers/url_providers.dart';
import '../services/clipboard.dart';
import '../services/data_storage.dart';

class ShareRepository with FileCreator {
  static const List<ColorsUrlProvider> providers = [
    ArtsGoogle(),
    ColorCombos(),
    ColorDesigner(),
    Colordot(),
    Coolors(),
    MuzliColors(),
    Palettable(),
    Poolors(),
  ];

  late final String storagePath;

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

  Future<void> init() async => storagePath = (await DataStorage.directory).path;

  void asUrl(ColorPalette palette) => _convertColorsToUrl(palette);

  void copyUrl(ColorPalette palette) => _convertColorsToUrl(palette, copyOnly: true);

  Future<void> asPdf(ColorPalette pallete) async => _shareFile(await generateFile(pallete));

  Future<bool> asPng(ColorPalette pallete) async {
    //TODO! Add try/catch in bloc and show error in UI.
    bool canShare = true;
    await Printing.raster(await generateFile(pallete), pages: [0, 1]).forEach((page) async {
      try {
        canShare = await _shareFile(await page.toPng(), isPdf: false);
        // ignore: avoid_catches_without_on_clauses
      } catch (e) {
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
