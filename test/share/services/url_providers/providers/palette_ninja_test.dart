import 'package:colors_ai/share/services/url_providers/colors_url_provider.dart';
import 'package:flutter_test/flutter_test.dart';

import '../data.dart';

void main() => group(
      '$PaletteNinja',
      () {
        test('url()', () => expect(const PaletteNinja().url(palette), 'https://palette.ninja/#000000-#ffffff'));

        test('formats', () => expect(const PaletteNinja().formats, isNotEmpty));
      },
    );
