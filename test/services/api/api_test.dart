import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: avoid_relative_lib_imports
import '../../../lib/models/colors/colors_json.dart';
import '../../../lib/services/api/api.dart';

void main() => test('API returns new colors', () async {
      const api = API();
      const colorsAI = ColorsAI();
      ColorsAI newColors;

      newColors = await api.getNewColors(colorsAI);

      expect(newColors.list.isNotEmpty, true);
    });
