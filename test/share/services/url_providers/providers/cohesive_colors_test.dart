import 'package:colors_ai/share/services/url_providers/colors_url_provider.dart';
import 'package:flutter_test/flutter_test.dart';

import '../data.dart';

void main() => group(
      '$CohesiveColors',
      () => test(
        'url()',
        () => expect(const CohesiveColors().url(palette), 'https://javier.xyz/cohesive-colors/?src=000000,ffffff'),
      ),
    );
