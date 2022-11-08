part of '../colors_url_provider.dart';

/// Example: https://artsexperiments.withgoogle.com/artpalette/colors/dacda4-c5b58c-a6dba4-a89671-8a7758.
class ArtsGoogle extends ColorsUrlProvider {
  const ArtsGoogle({
    super.baseUrl = 'artsexperiments.withgoogle.com/artpalette/colors/',
    super.providerName = 'Arts & Culture (Google)',
  });
}
