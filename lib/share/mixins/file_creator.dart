import 'dart:typed_data' show Uint8List;

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart' show fontFromAssetBundle;

import '../../core/models/color_palette/color_palette.dart';
import '../services/export/file_export.dart';

mixin FileCreator {
  static const PdfPageFormat _a4 =
          PdfPageFormat(29.7 * PdfPageFormat.cm, 21 * PdfPageFormat.cm, marginAll: PdfPageFormat.cm),
      _letter = PdfPageFormat(11 * PdfPageFormat.inch, 8.5 * PdfPageFormat.inch, marginAll: 0.5 * PdfPageFormat.inch);

  Future<Uint8List> generateFile(ColorPalette colors, {bool isMetric = true}) async {
    final PdfPageFormat format = isMetric ? _a4 : _letter;
    final TtfFont font = await fontFromAssetBundle('google_fonts/Roboto-Regular.ttf');
    final document = Document(version: PdfVersion.pdf_1_5)
      ..addPage(Page(
          pageTheme: PageTheme(pageFormat: format, orientation: PageOrientation.landscape),
          build: (_) => FileLayout(colors, format, font)));

    return document.save();
  }
}
