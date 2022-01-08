import 'package:colors_ai/share/services/url_providers/colors_url_provider.dart';
import 'package:flutter_test/flutter_test.dart';

import '../data.dart';

void main() => group(
      '$ColorDesigner',
      () => test(
        'url()',
        () =>
            expect(const ColorDesigner().url(palette), 'https://colordesigner.io/?presentationMode=true#000000-ffffff'),
      ),
    );
