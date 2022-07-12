import 'dart:typed_data' show Uint8List;

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart' show fontFromAssetBundle;

import '../../core/models/color_palette/color_palette.dart';
import '../services/export/file_layout.dart';

mixin FileCreator {
  Future<Uint8List> generateFile(ColorPalette colors, {bool isMetric = true}) async {
    const PdfPageFormat a4Format =
        PdfPageFormat(PdfPageFormat.cm * 29.7, PdfPageFormat.cm * 21, marginAll: PdfPageFormat.cm);
    const PdfPageFormat letter =
        PdfPageFormat(PdfPageFormat.inch * 11, PdfPageFormat.inch * 8.5, marginAll: PdfPageFormat.inch * 0.5);

    final PdfPageFormat format = isMetric ? a4Format : letter;
    final TtfFont font = await fontFromAssetBundle('assets/google_fonts/Roboto-Regular.ttf');
    final Document document = Document()
      ..addPage(
        Page(
          pageTheme: PageTheme(pageFormat: format, orientation: PageOrientation.landscape),
          build: (_) => FileLayout(colors, format, font),
        ),
      );

    return document.save();
  }
}
