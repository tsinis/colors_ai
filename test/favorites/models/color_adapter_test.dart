import 'package:colors_ai/favorites/models/color_adapter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => group('$ColorAdapter', () {
      final ColorAdapter adapter = ColorAdapter();
      test('typeId', () => expect(adapter.typeId, 200));
    });
