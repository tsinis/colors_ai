import 'package:colors_ai/share/services/url_providers/colors_url_provider.dart';
import 'package:flutter_test/flutter_test.dart';

import '../data.dart';

void main() => group(
      '$Huemint',
      () => test(
        'url()',
        () => expect(
          const Huemint().url(palette),
          'https://huemint.com/gradient-5/#palette=000000-ffffff',
        ),
      ),
    );
