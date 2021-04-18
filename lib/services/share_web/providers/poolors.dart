part of '../url_provider.dart';

class Poolors extends ColorsUrlProvider {
  const Poolors(ColorPalette palette)
      : super(
          palette,
          baseUrl: 'https://poolors.com/',
          providerName: 'Poolors',
        );
  // https://poolors.com/32b966-0c1a14-433025-843272-b9e1e5
}
