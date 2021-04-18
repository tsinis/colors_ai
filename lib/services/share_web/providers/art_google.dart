part of '../url_provider.dart';

class ArtsGoogle extends ColorsUrlProvider {
  const ArtsGoogle(ColorPalette palette)
      : super(
          palette,
          baseUrl: 'https://artsexperiments.withgoogle.com/artpalette/colors/',
          providerName: 'Arts & Culture (Google)',
        );
  // https://artsexperiments.withgoogle.com/artpalette/colors/dacda4-c5b58c-a6dba4-a89671-8a7758
}
