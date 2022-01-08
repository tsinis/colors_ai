import 'package:colors_ai/share/services/url_providers/colors_url_provider.dart';
import 'package:flutter_test/flutter_test.dart';

import '../data.dart';

void main() => group(
      '$Poolors',
      () => test('url()', () => expect(const Poolors().url(palette), 'https://poolors.com/000000-ffffff')),
    );
