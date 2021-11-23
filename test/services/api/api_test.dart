import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: avoid_relative_lib_imports
import '../../../lib/color_generator/models/colors/colors_ai.dart';
import '../../../lib/color_generator/services/api/colormind/colormind_api.dart';

void main() => test('API returns new colors', () async {
      const api = ColormindAPI();
      final colorsAI = ColorsAI();
      ColorsAI newColors;

      newColors = await api.fetchNewColors(colorsAI, lockedColors: [false, false, false, false, false]);

      expect(newColors.list.isNotEmpty, true);
    });
