import 'package:colors_ai/share/services/url_providers/colors_url_provider.dart';
import 'package:flutter_test/flutter_test.dart';

import '../data.dart';

void main() => group(
      '$SessionsCollege',
      () => test(
        'url()',
        () => expect(
          const SessionsCollege().url(palette),
          'https://www.sessions.edu/color-calculator-results/?colors=000000,ffffff',
        ),
      ),
    );
