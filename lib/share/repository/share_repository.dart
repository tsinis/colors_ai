import 'dart:io' show File;
import 'dart:typed_data' show Uint8List;

import 'package:file_selector/file_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:platform_info/platform_info.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/models/color_palette/color_palette.dart';
import '../../core/services/clipboard.dart';
import '../../core/ui/constants.dart';
import '../mixins/device_capabilities.dart';
import '../mixins/file_creator.dart';
import '../mixins/text_based_file_creator.dart';
import '../models/file_format_enum.dart';
import '../services/url_providers/url_providers.dart';
import 'conditional_import/share_io_png.dart' if (dart.library.js) 'conditional_import/share_web_png.dart';

class ShareRepository with FileCreator, TextBasedFileCreator, DeviceCapabilities {
  static const List<ColorsUrlProvider> providers = [
    ArtsGoogle(),
    CohesiveColors(),
    ColorCombos(),
    ColorDesigner(),
    Colordot(),
    Coolors(),
    DesignAI(),
    DopelyColors(),
    MakeTintsAndShades(),
    MuzliColors(),
    Palettable(),
    PalleteNinja(),
    Poolors(),
    SessionsCollege(),
  ];

  static const Clipboards _clipboard = Clipboards();

  int? _formatIndex;
  int? _providerIndex;

  int? get formatIndex => _formatIndex;

  set formatIndex(int? newFormatIndex) {
    if (newFormatIndex != null && newFormatIndex != _formatIndex) {
      _formatIndex = newFormatIndex;
    }
  }

  // Create File Format list for specific OS.
  FileFormat get _selectedFile => FileFormat.values.elementAt(_formatIndex ?? 0);

  String get _fileExtension => _selectedFile.format.toLowerCase();
  String get _fileName => 'colors_ai.$_fileExtension';
  String get _filePath => '$storagePath/$_fileName';

  int? get providerIndex => _providerIndex;

  set providerIndex(int? newProviderIndex) {
    if (newProviderIndex != null && newProviderIndex != _providerIndex) {
      _providerIndex = newProviderIndex;
    }
  }

  void asUrl(ColorPalette palette) => _convertColorsToUrl(palette);

  void copyUrl(ColorPalette palette) => _convertColorsToUrl(palette, copyOnly: true);

  Future<void> asFile(ColorPalette palette) async {
    try {
      switch (_selectedFile) {
        case FileFormat.pdfA4:
          await _shareBytes(await generateFile(palette));
          break;
        case FileFormat.pdfLetter:
          await _shareBytes(await generateFile(palette, isMetric: false));
          break;
        case FileFormat.pngA4:
          await Printing.raster(await generateFile(palette)).forEach((page) async => _shareBytes(await page.toPng()));
          break;
        case FileFormat.pngLetter:
          await Printing.raster(await generateFile(palette, isMetric: false))
              .forEach((page) async => _shareBytes(await page.toPng()));
          break;
        case FileFormat.svg:
          await _shareTextData(toSvg(palette));
          break;
        case FileFormat.json:
          await _shareTextData(toJson(palette));
          break;
        case FileFormat.scss:
          await _shareTextData(toScss(palette));
          break;
      }
      // ignore: avoid_catches_without_on_clauses
    } catch (_) {
      rethrow;
    }
  }

  Future<void> copyFile(ColorPalette palette) async {
    try {
      switch (_selectedFile) {
        case FileFormat.svg:
          await _clipboard.copyTextData(toSvg(palette));
          break;
        case FileFormat.json:
          await _clipboard.copyTextData(toJson(palette));
          break;
        case FileFormat.scss:
          await _clipboard.copyTextData(toScss(palette));
          break;
        case FileFormat.pdfA4:
        case FileFormat.pdfLetter:
        case FileFormat.pngA4:
        case FileFormat.pngLetter:
          break;
      }
      // ignore: avoid_catches_without_on_clauses
    } catch (_) {
      rethrow;
    }
  }

  Future<bool> _shareBytes(Uint8List bytes) async {
    if (kIsWeb) {
      if (_fileExtension == 'pdf') {
        return Printing.sharePdf(bytes: bytes);
      } else if (_fileExtension == 'png') {
        return shareWebPng(bytes, filename: _fileName);
      }
    }
    final File file = File(_filePath)..writeAsBytesSync(bytes.toList());

    return _shareFile(file);
  }

  Future<bool> _shareTextData(String data) async {
    final File file = File(_filePath)..writeAsStringSync(data);

    return _shareFile(file);
  }

  Future<void> _saveFile(File file) async {
    final String? path = await getSavePath();
    if (path == null) {
      return;
    }
    final XFile textFile = XFile(file.path, name: _fileName);
    await textFile.saveTo(path);
  }

  Future<bool> _shareFile(File file) async {
    if (file.existsSync()) {
      if (!kIsWeb && (platform.isWindows || platform.isLinux)) {
        await _saveFile(file);
      } else {
        await Share.shareFiles([_filePath], subject: appName);
      }

      return true;
    } else {
      return false;
    }
  }

  Future<void> _convertColorsToUrl(ColorPalette palette, {bool copyOnly = false}) async {
    final ColorsUrlProvider provider = providers[providerIndex ?? 0];
    final String url = provider.url(palette);
    copyOnly ? await _clipboard.copyUrl(url) : await Share.share(url, subject: appName);
  }
}
