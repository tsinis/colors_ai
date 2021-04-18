part of '../url_provider.dart';

class Colordot extends ColorsUrlProvider {
  const Colordot(ColorPalette palette)
      : super(
          palette,
          baseUrl: 'https://color.hailpixel.com/#',
          separateSymbol: ',',
          providerName: 'Colordot',
        );
  // https://color.hailpixel.com/#29407A,5AB43C,2D6B24,A9CD6A,256F41
}
