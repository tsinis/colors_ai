part of '../colors_url_provider.dart';

/// Example: https://colors.dopely.top/color-wheel/custom/691b82-31cea7-c74f4f-59178e-aeb4a2.
class DopelyColors extends ColorsUrlProvider {
  const DopelyColors({
    super.baseUrl = 'colors.dopely.top/color-wheel/custom/',
    super.formats = 'JPG, JPEG, CSS, PDF, PNG, SVG, TXT, HTML +',
  });
}
