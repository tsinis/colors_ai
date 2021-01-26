part of '../providers_list.dart';

class Colordot extends ColorsUrlProvider {
  Colordot(List<Color> colors) : super(colors, baseUrl: 'https://color.hailpixel.com/#', separateSymbol: ',');
  // https://color.hailpixel.com/#29407A,5AB43C,2D6B24,A9CD6A,256F41
}
