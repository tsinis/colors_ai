import 'package:colors_ai/share/services/url_providers/colors_url_provider.dart';
import 'package:flutter_test/flutter_test.dart';

import '../data.dart';

void main() => group(
      '$Palettable',
      () {
        test(
          'url()',
          () => expect(const Palettable().url(palette), 'https://www.palettable.io/000000-ffffff'),
        );

        test('formats', () => expect(const Palettable().formats, isNotEmpty));
      },
    );
