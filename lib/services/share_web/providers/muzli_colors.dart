part of '../url_provider.dart';

class MuzliColors extends ColorsUrlProvider {
  const MuzliColors(ColorPalette palette)
      : super(
          palette,
          baseUrl: 'https://colors.muz.li/palette/',
          separateSymbol: '/',
          formats: 'InVision UI Kit, SVG',
          providerName: 'Muzli Colors',
        );
  // https://colors.muz.li/palette/ffbebe/b38585/ffefef/ffdfdf/ffffff
}
