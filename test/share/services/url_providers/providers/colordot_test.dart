import 'package:colors_ai/share/services/url_providers/colors_url_provider.dart';
import 'package:flutter_test/flutter_test.dart';

import '../data.dart';

void main() => group(
      '$Colordot',
      () => test('url()', () => expect(const Colordot().url(palette), 'https://color.hailpixel.com/#000000,ffffff')),
    );
