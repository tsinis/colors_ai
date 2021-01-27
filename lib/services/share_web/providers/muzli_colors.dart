part of '../url_provider.dart';

class MuzliColors extends ColorsUrlProvider {
  const MuzliColors(List<Color> colors)
      : super(
          colors,
          baseUrl: 'https://colors.muz.li/palette/',
          separateSymbol: '/',
          formats: 'InVision UI Kit, SVG',
          providerName: 'Muzli Colors',
        );
  // https://colors.muz.li/palette/ffbebe/b38585/ffefef/ffdfdf/ffffff
}
