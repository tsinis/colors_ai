part of '../url_provider.dart';

class ColorDesigner extends ColorsUrlProvider {
  const ColorDesigner(List<Color> colors)
      : super(
          colors,
          baseUrl: 'https://colordesigner.io/?presentationMode=true#',
          providerName: 'Color Designer',
        );
  // https://colordesigner.io/?presentationMode=true#FFDCD5-F85B5C-F74849-F7454A-DC1317
}
