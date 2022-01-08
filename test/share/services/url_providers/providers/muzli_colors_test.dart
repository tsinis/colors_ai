import 'package:colors_ai/share/services/url_providers/colors_url_provider.dart';
import 'package:flutter_test/flutter_test.dart';

import '../data.dart';

void main() => group(
      '$MuzliColors',
      () {
        test(
          'url()',
          () => expect(const MuzliColors().url(palette), 'https://colors.muz.li/palette/000000/ffffff'),
        );

        test('formats', () => expect(const MuzliColors().formats, isNotEmpty));
      },
    );
