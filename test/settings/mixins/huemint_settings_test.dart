import 'package:colors_ai/settings/mixins/huemint_settings.dart';
import 'package:flutter_test/flutter_test.dart';

class _HuemintSettingsTest with HuemintSettings {}

void main() {
  final _HuemintSettingsTest huemintSettings = _HuemintSettingsTest();

  group('$HuemintSettings', () {
    test('parameters', () {
      expect(huemintSettings.huemintAdjacency, HuemintSettings.adjacencyMax ~/ 2);
      expect(huemintSettings.huemintTemperature, HuemintSettings.temperatureMax / 2);
      huemintSettings
        ..huemintAdjacency = 0
        ..huemintTemperature = 0;
      expect(huemintSettings.huemintAdjacency, 0);
      expect(huemintSettings.huemintTemperature, 0);
    });

    test('statics', () {
      expect(HuemintSettings.adjacencyMax, isNonNegative);
      expect(HuemintSettings.adjacencyMin, isNonNegative);
      expect(HuemintSettings.temperatureMax, isNonNegative);
      expect(HuemintSettings.temperatureMin, isNonNegative);
    });
  });
}
