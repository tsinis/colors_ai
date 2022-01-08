import 'package:colors_ai/core/models/typedef_aliases/is_locked.dart';
import 'package:flutter_test/flutter_test.dart';

void main() => group('IsLocked', () {
      test('is bool', () => expect(false, isA<IsLocked>()));
      test('is not List<bool>', () => expect(<bool>[true], isNot(IsLocked)));
    });
