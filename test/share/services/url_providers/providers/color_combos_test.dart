import 'package:colors_ai/share/services/url_providers/colors_url_provider.dart';
import 'package:flutter_test/flutter_test.dart';

import '../data.dart';

void main() => group(
      '$ColorCombos',
      () {
        test(
          'url()',
          () => expect(
            const ColorCombos().url(palette),
            'https://www.colorcombos.com/combotester.html?color0=000000&color1=ffffff',
          ),
        );

        test('formats', () => expect(const ColorCombos().formats, isNotEmpty));
      },
    );
