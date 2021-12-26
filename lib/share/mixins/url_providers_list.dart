import '../services/url_providers/colors_url_provider.dart';

mixin UrlProvidersList {
  static const List<ColorsUrlProvider> providers = <ColorsUrlProvider>[
    ArtsGoogle(),
    CohesiveColors(),
    ColorCombos(),
    ColorDesigner(),
    Colordot(),
    Coolors(),
    DesignAI(),
    DopelyColors(),
    Huemint(),
    MakeTintsAndShades(),
    MuzliColors(),
    Palettable(),
    PaletteNinja(),
    Poolors(),
    SessionsCollege(),
  ];

  Map<String, ColorsUrlProvider> get _map => <String, ColorsUrlProvider>{
        for (final ColorsUrlProvider provider in providers) provider.keyName: provider,
      };

  ColorsUrlProvider? urlProviderByKeyName(String? keyName) => _map[keyName];
}
