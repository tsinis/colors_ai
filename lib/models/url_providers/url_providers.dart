import '../../services/share_web/url_provider.dart';

import '../hive/color_palette.dart';

class UrlProviders {
  const UrlProviders({required this.palette});

  final ColorPalette palette;

  List<ColorsUrlProvider> get list => [
        ArtsGoogle(palette),
        Coolors(palette),
        MuzliColors(palette),
        Palettable(palette),
      ];
}
