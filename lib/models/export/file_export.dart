import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:color_converter/color_converter.dart';

import '../../extensions/color_to_hex.dart';
import '../../models/hive/color_palette.dart';

class FileLayout extends StatelessWidget {
  FileLayout(this._palette, this._format);
  final PdfPageFormat _format;
  final ColorPalette _palette;

  static const Set<String> _colorSpaces = {'HEX', 'RGB', 'CMYK', 'HSB', 'HSL', 'LAB', 'XYZ'};

  String _colorValue(String space, String hex) {
    switch (space) {
      case 'RGB':
        return hexToRgb(hex).toString();
      case 'CMYK':
        final CMYK cmyk = hexToCmyk(hex);
        return '${cmyk.c}, ${cmyk.m}, ${cmyk.y}, ${cmyk.k}';
      case 'HSB':
        final HSB hsb = hexToHsb(hex);
        return '${hsb.h}, ${hsb.s}, ${hsb.b}';
      case 'HSL':
        final HSL hsl = hexToHsl(hex);
        return '${hsl.h}, ${hsl.s}, ${hsl.l}';
      case 'LAB':
        final LAB lab = hexToLab(hex);
        return '${lab.l}, ${lab.a}, ${lab.b}';
      case 'XYZ':
        final XYZ xyz = hexToXyz(hex);
        return '${xyz.x.toStringAsFixed(2)}, ${xyz.y.toStringAsFixed(2)}, ${xyz.z.toStringAsFixed(2)}';
      default:
        return hex;
    }
  }

  double get _width =>
      (_format.width - _format.marginLeft - _format.marginRight - (_format.marginRight / 4)) / _palette.colors.length;
  double get _height => _format.height - _format.marginTop - _format.marginBottom;

  @override
  Widget build(Context context) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(_palette.colors.length, (colorsIndex) {
        final String hex = _palette.colors.elementAt(colorsIndex).toHex();
        return Column(children: [
          Container(width: _width, height: _height * (3 / 4), color: PdfColor.fromHex(hex)),
          Spacer(),
          SizedBox(
              width: _width * 0.9,
              child: Column(
                  children: List.generate(_colorSpaces.length, (spacesIndex) {
                final bool isEven = spacesIndex.isEven;
                final String colorSpace = _colorSpaces.elementAt(spacesIndex);
                return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                  Text(colorSpace,
                      style: TextStyle(fontSize: 11, color: isEven ? PdfColors.grey800 : PdfColors.grey500)),
                  Spacer(),
                  Text(_colorValue(colorSpace, hex),
                      style: TextStyle(fontSize: 11, color: isEven ? PdfColors.grey900 : PdfColors.grey600))
                ]);
              })))
        ]);
      }));
}
