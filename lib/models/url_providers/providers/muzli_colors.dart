part of '../../url_providers/url_providers.dart';

class MuzliColors extends ColorsUrlProvider {
  const MuzliColors()
      : super(
          baseUrl: 'https://colors.muz.li/palette/',
          separateSymbol: '/',
          formats: 'InVision UI Kit, SVG',
          providerName: 'Muzli Colors',
        );
  // https://colors.muz.li/palette/ffbebe/b38585/ffefef/ffdfdf/ffffff
}
