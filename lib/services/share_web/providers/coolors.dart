part of '../url_provider.dart';

class Coolors extends ColorsUrlProvider {
  const Coolors(ColorPalette palette)
      : super(
          palette,
          baseUrl: 'https://coolors.co/',
          formats: 'ASE, CSS, PDF, PNG, SVG +',
          providerName: 'Coolors',
        );
  // https://coolors.co/ffdcd5-f85b5c-f74849-f7454a-dc1317
}
