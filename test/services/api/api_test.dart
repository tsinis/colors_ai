import 'package:colors_ai/models/colors/colors_json.dart';
import 'package:colors_ai/services/api/api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('api returns new colors', () async {
    const api = API();
    const colorsAI = ColorsAI();
    ColorsAI newColors;

    newColors = await api.getNewColors(colorsAI);

    expect(newColors.list.isNotEmpty, true);
  });
}
