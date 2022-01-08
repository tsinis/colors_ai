import 'package:colors_ai/settings/mixins/colormind_settings.dart';
import 'package:flutter_test/flutter_test.dart';

class _ColormindSettingsTest with ColormindSettings {}

void main() {
  final _ColormindSettingsTest colormindSettings = _ColormindSettingsTest();
  test('$ColormindSettings', () {
    expect(colormindSettings.colormindForUI, false);
    colormindSettings.colormindForUI = true;
    expect(colormindSettings.colormindForUI, true);
  });
}
