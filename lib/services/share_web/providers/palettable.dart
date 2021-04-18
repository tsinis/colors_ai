part of '../url_provider.dart';

class Palettable extends ColorsUrlProvider {
  const Palettable(ColorPalette palette)
      : super(
          palette,
          baseUrl: 'https://www.palettable.io/',
          formats: 'PNG',
          providerName: 'Palettable',
        );
  // https://www.palettable.io/F1D6DE-E87A9B-F986E4-FF82C0-F990BA
}
