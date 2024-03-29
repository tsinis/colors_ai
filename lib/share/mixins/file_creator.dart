import 'dart:typed_data' show Uint8List;

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart' show fontFromAssetBundle;

import '../../core/models/color_palette/color_palette.dart';
import '../../resources/fonts.dart';
import '../services/export/file_layout.dart';

mixin FileCreator {
  static const PdfPageFormat _a4Format =
      PdfPageFormat(PdfPageFormat.cm * 29.7, PdfPageFormat.cm * 21, marginAll: PdfPageFormat.cm);
  static const PdfPageFormat _letter =
      PdfPageFormat(PdfPageFormat.inch * 11, PdfPageFormat.inch * 8.5, marginAll: PdfPageFormat.inch * 0.5);

  Future<Uint8List> generateFile(ColorPalette colors, {bool isMetric = true}) async {
    final PdfPageFormat format = isMetric ? _a4Format : _letter;
    final TtfFont font = await fontFromAssetBundle(Fonts.robotoRegular);
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
