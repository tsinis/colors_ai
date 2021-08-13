import '../../core/extensions/color.dart';
import '../../core/models/color_palette/color_palette.dart';

mixin TextBasedFileCreator {
  String toSvg(ColorPalette palette) {
    final int width = palette.colors.length * 100;
    final String start = '''
    <svg xmlns="http://www.w3.org/2000/svg" style="isolation:isolate" viewBox="0 0 $width 100">
      <defs>
        <clipPath id="a">
          <rect width="$width" height="100"/>
        </clipPath>
      </defs>
      <g clip-path="url(#a)">
      ''',
        end = '''

      </g>
    </svg>''';
    final StringBuffer sb = StringBuffer()..write(start);
    for (var i = 0; i < palette.colors.length; i++) {
      final String color = palette.colors.elementAt(i).toHex();
      final int x = i * 100;
      sb.write('<rect width="100" height="100" x="$x" fill="#$color"/>');
    }
    sb.write(end);
    return sb.toString();
  }
}
