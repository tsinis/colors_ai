part of '../colors_url_provider.dart';

class DopelyColors extends ColorsUrlProvider {
  const DopelyColors()
      : super(
          // ignore: format-comment because it's coverage fix.
          // coverage:ignore-line
          baseUrl: 'colors.dopely.top/color-wheel/custom/',
          formats: 'JPG, JPEG, CSS, PDF, PNG, SVG, TXT, HTML +',
        );
  // Example: https://colors.dopely.top/color-wheel/custom/691b82-31cea7-c74f4f-59178e-aeb4a2.
}
