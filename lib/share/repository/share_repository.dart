import 'dart:io' show File;
// ignore: unnecessary_import, because DCM is not yet updated to Flutter 3.3.0
import 'dart:typed_data' show Uint8List;

import 'package:file_selector/file_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:platform_info/platform_info.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/models/color_palette/color_palette.dart';
import '../../core/services/clipboard.dart';
import '../../core/ui/constants.dart';
import '../extensions/file_format_extension.dart';
import '../mixins/device_capabilities.dart';
import '../mixins/file_creator.dart';
import '../mixins/text_based_file_creator.dart';
import '../mixins/url_providers_list.dart';
import '../models/file_format.dart';
import '../services/url_providers/colors_url_provider.dart';
import 'conditional_import/share_io_png.dart' if (dart.library.js) 'conditional_import/share_web_png.dart';

class ShareRepository with FileCreator, TextBasedFileCreator, DeviceCapabilities, UrlProvidersList {
  final ClipBoard _clipboard;
  FileFormat? _selectedFormat;
  final String _nameOfFile;
  ColorsUrlProvider? _selectedUrlProvider;

  FileFormat? get selectedFormat => _selectedFormat;
  ColorsUrlProvider? get selectedUrlProvider => _selectedUrlProvider;

  String get _fileExtension => _selectedFile.format.toLowerCase();
  String get _fileName => '$_nameOfFile.$_fileExtension';
  String get _filePath => '$storagePath/$_fileName';

  FileFormat get _selectedFile => _selectedFormat ?? FileFormat.values.first;

  set selectedFormat(FileFormat? newFormat) {
    if (newFormat != null && _selectedFormat != newFormat) {
      _selectedFormat = newFormat;
    }
  }

  set selectedUrlProvider(ColorsUrlProvider? newProvider) {
    if (newProvider != null && _selectedUrlProvider != newProvider) {
      _selectedUrlProvider = newProvider;
    }
  }

  ShareRepository({ClipBoard clipboard = const ClipBoard(), String nameOfFile = kNameForFileSystem})
      : _clipboard = clipboard,
        _nameOfFile = nameOfFile;

  void restoreFormatFromJson(String format) => selectedFormat = FileFormat.values.byName(format);

  void restoreUrlProviderFromJson(String provider) => selectedUrlProvider = urlProviderByKeyName(provider);

  Future<bool> asFile(ColorPalette palette) async {
    try {
      switch (_selectedFile) {
        case FileFormat.pdfA4:
          await _shareBytes(await generateFile(palette));
          break;
        case FileFormat.pdfLetter:
          await _shareBytes(await generateFile(palette, isMetric: false));
          break;
        case FileFormat.pngA4:
          await Printing.raster(await generateFile(palette)).forEach(
            (PdfRaster page) async => _shareBytes(await page.toPng()),
          );
          break;
        case FileFormat.pngLetter:
          await Printing.raster(await generateFile(palette, isMetric: false))
              .forEach((PdfRaster page) async => _shareBytes(await page.toPng()));
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

      return true;
    } catch (_) {
      return false;
    }
  }

  Future<void> asUrl(ColorPalette palette) => _convertColorsToUrl(palette);

  Future<bool> copyFile(ColorPalette palette) async {
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

      return true;
    } catch (_) {
      return false;
    }
  }

  Future<void> copyUrl(ColorPalette palette) => _convertColorsToUrl(palette, copyOnly: true);

  Future<void> _convertColorsToUrl(ColorPalette palette, {bool copyOnly = false}) async {
    final ColorsUrlProvider urlProvider = _selectedUrlProvider ?? UrlProvidersList.providers.first;
    final String url = urlProvider.url(palette);
    copyOnly ? await _clipboard.copyTextData(url) : await Share.share(url, subject: kAppName);
  }

  Future<void> _saveFile(File file) async {
    final String? path = await getSavePath();
    if (path == null) {
      return;
    }
    final XFile textFile = XFile(file.path, name: _fileName);
    await textFile.saveTo(path);
  }

  Future<bool> _shareBytes(Uint8List bytes) {
    if (kIsWeb) {
      if (_fileExtension == 'pdf') {
        return Printing.sharePdf(bytes: bytes);
      } else if (_fileExtension == 'png') {
        return shareWebPng(bytes, filename: _fileName);
      }
    }
    final File file = File(_filePath)..writeAsBytesSync(bytes.toList(growable: false));

    return _shareFile(file);
  }

  Future<bool> _shareFile(File file) async {
    if (file.existsSync()) {
      if (!kIsWeb && (platform.isWindows || platform.isLinux)) {
        await _saveFile(file);
      } else {
        await Share.shareFiles(<String>[_filePath], subject: kAppName);
      }

      return true;
    } else {
      return false;
    }
  }

  Future<bool> _shareTextData(String data) {
    final File file = File(_filePath)..writeAsStringSync(data);

    return _shareFile(file);
  }
}
