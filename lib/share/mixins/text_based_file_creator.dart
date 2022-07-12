import '../../core/extensions/color_extensions.dart';
import '../../core/models/color_palette/color_palette.dart';

mixin TextBasedFileCreator {
  String toSvg(ColorPalette palette) {
    final int width = palette.colors.length * 100;
    final String start = '''
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 $width 100">
      <defs>
        <clipPath id="a">
          <rect width="$width" height="100"/>
        </clipPath>
      </defs>
      <g clip-path="url(#a)">''';
    const String end = '''

      </g>
    </svg>''';
    final StringBuffer sb = StringBuffer(start);
    for (int i = 0; i < palette.colors.length; i++) {
      final String color = palette.colors.elementAt(i).toHex();
      final int x = i * 100;
      sb.write('\n        <rect width="100" height="100" x="$x" fill="#$color"/>');
    }
    sb.write(end);

    return sb.toString();
  }

  String toJson(ColorPalette palette) {
    const String start = '{';
    const String end = '\n}';
    final StringBuffer sb = StringBuffer(start);
    for (int i = 0; i < palette.colors.length; i++) {
      final String color = palette.colors.elementAt(i).toHex();
      sb.write('\n  "color-${i + 1}": "#$color"');
      if (i != palette.colors.length - 1) {
        sb.write(',');
      }
    }
    sb.write(end);

    return sb.toString();
  }

  String toScss(ColorPalette palette) {
    final StringBuffer sb = StringBuffer();
    for (int i = 0; i < palette.colors.length; i++) {
      final String color = palette.colors.elementAt(i).toHex().toLowerCase();
      final String newLine = (i == 0) ? '' : '\n';
      // Ignored because it's more readable this way.
      // ignore: prefer_interpolation_to_compose_strings
      sb.write(newLine + r'$color-' '${i + 1}: #${color}ff;');
    }

    return sb.toString();
  }
}
