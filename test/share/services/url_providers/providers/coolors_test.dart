import 'package:colors_ai/share/services/url_providers/colors_url_provider.dart';
import 'package:flutter_test/flutter_test.dart';

import '../data.dart';

void main() => group(
      '$Coolors',
      () {
        test('url()', () => expect(const Coolors().url(palette), 'https://coolors.co/000000-ffffff'));

        test('formats', () => expect(const Coolors().formats, isNotEmpty));
      },
    );
