import 'dart:ui' show Color;

import '../../services/share_web/url_provider.dart';

class UrlProviders {
  const UrlProviders({this.colors = const []});

  final List<Color> colors;

  List<ColorsUrlProvider> get list => [
        ArtsGoogle(colors),
        Coolors(colors),
        MuzliColors(colors),
        Palettable(colors),
      ];
}
