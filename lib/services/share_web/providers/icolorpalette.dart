part of '../url_provider.dart';

class IColorPalette extends ColorsUrlProvider {
  const IColorPalette(List<Color> colors)
      : super(
          colors,
          baseUrl: 'https://icolorpalette.com/',
          separateSymbol: '_',
          formats: 'ASE, PDF, PNG, SVG +',
          providerName: 'iColorpalette',
        );
  // https://icolorpalette.com/fef301_ffe102_fccc04_ffb402_f99006 only works with existing pallets
}
