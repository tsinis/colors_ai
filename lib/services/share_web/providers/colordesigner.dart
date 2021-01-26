part of '../providers_list.dart';

class ColorDesigner extends ColorsUrlProvider {
  ColorDesigner(List<Color> colors) : super(colors, baseUrl: 'https://colordesigner.io/?presentationMode=true#');
  // https://colordesigner.io/?presentationMode=true#FFDCD5-F85B5C-F74849-F7454A-DC1317
}
