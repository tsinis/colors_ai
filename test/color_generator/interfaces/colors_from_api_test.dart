import 'package:colors_ai/color_generator/interfaces/colors_from_api.dart';
import 'package:colors_ai/core/models/color_palette/color_palette.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/src/response.dart';

import 'data.dart';

class _ColorsFromAPITest extends ColorsFromAPI {
  const _ColorsFromAPITest(super.colors);

  @override
  ColorPalette fromResponse(Response response) => const ColorPalette();
}

void main() => group('$ColorsFromAPI', () {
      const ColorsFromAPI colorsFromApi = _ColorsFromAPITest(colors);

      test('fromResponse()', () => expect(colorsFromApi.fromResponse(Response('body', 200)), const ColorPalette()));
    });
