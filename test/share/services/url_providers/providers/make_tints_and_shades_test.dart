import 'package:colors_ai/share/services/url_providers/colors_url_provider.dart';
import 'package:flutter_test/flutter_test.dart';

import '../data.dart';

void main() => group(
      '$MakeTintsAndShades',
      () => test(
        'url()',
        () => expect(const MakeTintsAndShades().url(palette), 'https://maketintsandshades.com/#000000,ffffff'),
      ),
    );
