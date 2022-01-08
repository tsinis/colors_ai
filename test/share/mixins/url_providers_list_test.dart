import 'package:colors_ai/share/mixins/url_providers_list.dart';
import 'package:colors_ai/share/services/url_providers/colors_url_provider.dart';
import 'package:flutter_test/flutter_test.dart';

class _UrlProvidersListTest with UrlProvidersList {}

void main() => group(
      '$UrlProvidersList',
      () {
        final _UrlProvidersListTest urlProviders = _UrlProvidersListTest();

        test('urlProviderByKeyName() with invalid name', () {
          final ColorsUrlProvider? provider = urlProviders.urlProviderByKeyName('');
          expect(provider, isNull);
        });

        test('urlProviderByKeyName() with valid name', () {
          final ColorsUrlProvider? provider = urlProviders.urlProviderByKeyName('$DesignAI');
          expect(provider, const DesignAI());
        });

        test('providers', () => expect(UrlProvidersList.providers.length, 15));
      },
    );
