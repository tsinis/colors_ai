part of '../url_providers.dart';

class DopelyColors extends ColorsUrlProvider {
  const DopelyColors()
      : super(
          baseUrl: 'colors.dopely.top/color-wheel/custom/',
          formats: 'JPG, JPEG, CSS, PDF, PNG, SVG, TXT, HTML +',
        );
  // https://colors.dopely.top/color-wheel/custom/691b82-31cea7-c74f4f-59178e-aeb4a2
}
