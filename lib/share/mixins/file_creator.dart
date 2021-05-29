import 'dart:typed_data' show Uint8List;

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '../../general/models/color_palette/color_palette.dart';
import '../services/export/file_export.dart';

mixin FileCreator {
  static const PdfPageFormat _a4 =
          PdfPageFormat(29.7 * PdfPageFormat.cm, 21 * PdfPageFormat.cm, marginAll: PdfPageFormat.cm),
      _letter = PdfPageFormat(11 * PdfPageFormat.inch, 8.5 * PdfPageFormat.inch, marginAll: 0.5 * PdfPageFormat.inch);

  Future<Uint8List> generateFile(ColorPalette colors, {bool isMetric = true}) async {
    final PdfPageFormat format = isMetric ? _a4 : _letter;

    final document = Document()
      ..addPage(Page(
          pageTheme: PageTheme(pageFormat: format, orientation: PageOrientation.landscape),
          build: (_) => FileLayout(colors, format)));

    return document.save();
  }
}
