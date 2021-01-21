import 'dart:ui';

import '../../extensions/color_to_hex.dart';

class Coolors {
  Coolors(this.colors);

  final List<Color> colors;

  static const String _startURL = 'https://coolors.co/', _dash = '-';

  // static const String _url = 'https://coolors.co/50514f-f25f5c-ffe066-247ba0-70c1b3';

  String get url {
    final StringBuffer sb = StringBuffer();
    // ignore: cascade_invocations
    sb.write(_startURL);
    for (final Color color in colors) {
      sb..write(color.toHex().toLowerCase())..write(_dash);
    }
    return sb.toString().substring(0, sb.length - 1);
  }
}
