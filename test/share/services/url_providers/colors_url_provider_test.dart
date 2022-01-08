import 'package:colors_ai/share/services/url_providers/colors_url_provider.dart';
import 'package:flutter_test/flutter_test.dart';

import 'data.dart';

class _ColorsUrlProviderTest extends ColorsUrlProvider {
  const _ColorsUrlProviderTest({
    required String baseUrl,
    required String separateSymbol,
    String? formats,
    String? providerName,
  }) : super(
          baseUrl: baseUrl,
          formats: formats,
          providerName: providerName,
          separateSymbol: separateSymbol,
        );
}

void main() {
  const String baseUrl = 'domain.com/';
  const String formats = 'format';
  const String separateSymbol = '+';

  const ColorsUrlProvider urlProvider = _ColorsUrlProviderTest(
    baseUrl: baseUrl,
    formats: formats,
    separateSymbol: separateSymbol,
  );

  final String keyName = urlProvider.runtimeType.toString();

  group('$ColorsUrlProvider', () {
    test('url()', () => expect(urlProvider.url(palette), 'https://${baseUrl}000000${separateSymbol}ffffff'));
    test('formats', () => expect(urlProvider.formats, formats));
    test('keyName', () => expect(urlProvider.keyName, keyName));
    test('props', () => expect(urlProvider.props, <String>[keyName]));
    test('name', () => expect(urlProvider.name, 'Colors Url Provider Test'));

    test('name via providerName constructor parameter', () {
      const String providerName = 'A';
      const ColorsUrlProvider namedUrlProvider = _ColorsUrlProviderTest(
        separateSymbol: separateSymbol,
        providerName: providerName,
        baseUrl: baseUrl,
      );
      expect(namedUrlProvider.name, providerName);
    });
  });
}
