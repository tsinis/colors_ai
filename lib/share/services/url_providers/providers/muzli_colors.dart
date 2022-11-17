part of '../colors_url_provider.dart';

/// Example: https://colors.muz.li/palette/ffbebe/b38585/ffefef/ffdfdf/ffffff.
class MuzliColors extends ColorsUrlProvider {
  const MuzliColors({
    super.baseUrl = 'colors.muz.li/palette/',
    super.formats = 'InVision UI Kit, SVG',
    super.separateSymbol = '/',
  });
}
