import 'package:colors_ai/share/services/url_providers/colors_url_provider.dart';
import 'package:flutter_test/flutter_test.dart';

import '../data.dart';

void main() => group('$ArtsGoogle', () {
      test(
        'url()',
        () => expect(
          const ArtsGoogle().url(palette),
          'https://artsexperiments.withgoogle.com/artpalette/colors/000000-ffffff',
        ),
      );
      test('providerName', () => expect(const ArtsGoogle().name, 'Arts & Culture (Google)'));
    });
