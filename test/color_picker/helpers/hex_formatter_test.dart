import 'package:colors_ai/color_picker/helpers/hex_formatter.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_test/flutter_test.dart';

import '../data.dart';

void main() {
  const String invalidHex = 'xY';
  const String partiallyValidHex = '#aXe';
  final String validHex = colorToHex(color);
  final HexFormatter hexFormatter = HexFormatter();

  group('$HexFormatter', () {
    group('formatInput', () {
      test('from invalid hex', () => expect(HexFormatter.formatInput(partiallyValidHex), 'AXE'));
      test('from valid hex', () => expect(colorFromHex(HexFormatter.formatInput(validHex)), color));
    });

    group('formatCompleteInput', () {
      test('from invalid hex', () => expect(HexFormatter.formatCompleteInput(partiallyValidHex), null));
      test('from partially invalid hex', () => expect(HexFormatter.formatCompleteInput(partiallyValidHex), null));
      test('from null', () => expect(HexFormatter.formatCompleteInput(null), null));
      test('from empty hex', () => expect(HexFormatter.formatCompleteInput(''), null));
      test('from valid hex', () => expect(colorFromHex(HexFormatter.formatCompleteInput(validHex) ?? ''), color));
    });
    group('formatEditUpdate', () {
      TextEditingValue oldValue = TextEditingValue.empty;
      late TextEditingValue newValue;
      test('formatEditUpdate with invalid new value', () {
        newValue = const TextEditingValue(text: invalidHex);

        final TextEditingValue value = hexFormatter.formatEditUpdate(oldValue, newValue);
        expect(value.text, isEmpty);
      });

      test('with partially invalid new value', () {
        newValue = const TextEditingValue(text: partiallyValidHex);

        final TextEditingValue value = hexFormatter.formatEditUpdate(oldValue, newValue);
        expect(value.text, 'A');
      });

      test('with empty old value', () {
        newValue = TextEditingValue(text: validHex);

        final TextEditingValue value = hexFormatter.formatEditUpdate(oldValue, newValue);
        expect(value.text, validHex);
      });

      test('with empty new value', () {
        oldValue = TextEditingValue(text: validHex);
        newValue = TextEditingValue.empty;

        final TextEditingValue value = hexFormatter.formatEditUpdate(oldValue, newValue);
        expect(value.text, isEmpty);
      });
    });
  });
}
