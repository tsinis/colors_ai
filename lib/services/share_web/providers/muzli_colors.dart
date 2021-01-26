part of '../providers_list.dart';

class MuzliColors extends ColorsUrlProvider {
  MuzliColors(List<Color> colors) : super(colors, baseUrl: 'https://colors.muz.li/palette/', separateSymbol: '/');
  // https://colors.muz.li/palette/ffbebe/b38585/ffefef/ffdfdf/ffffff
}
