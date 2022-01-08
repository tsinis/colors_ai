import 'package:colors_ai/share/services/url_providers/colors_url_provider.dart';
import 'package:flutter_test/flutter_test.dart';

import '../data.dart';

void main() => group('$DesignAI', () {
      test(
        'url()',
        () => expect(
          const DesignAI().url(palette),
          'https://designs.ai/colors/color-wheel?colors=%23000000,%23ffffff',
        ),
      );
      test('providerName', () => expect(const DesignAI().name, 'Design AI'));
    });
