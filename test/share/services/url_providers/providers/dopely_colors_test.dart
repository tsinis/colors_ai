import 'package:colors_ai/share/services/url_providers/colors_url_provider.dart';
import 'package:flutter_test/flutter_test.dart';

import '../data.dart';

void main() => group(
      '$DopelyColors',
      () {
        test(
          'url()',
          () => expect(
            const DopelyColors().url(palette),
            'https://colors.dopely.top/color-wheel/custom/000000-ffffff',
          ),
        );

        test('formats', () => expect(const DopelyColors().formats, isNotEmpty));
      },
    );
