part of '../../url_providers/url_providers.dart';

class IColorPalette extends ColorsUrlProvider {
  const IColorPalette()
      : super(
          baseUrl: 'https://icolorpalette.com/',
          separateSymbol: '_',
          formats: 'ASE, PDF, PNG, SVG +',
          providerName: 'iColorpalette',
        );
  // https://icolorpalette.com/fef301_ffe102_fccc04_ffb402_f99006 only works with existing paletts
}
