import 'package:collection/collection.dart' show IterableEquality;
import 'package:flutter_test/flutter_test.dart';

// ignore_for_file: avoid_relative_lib_imports
import '../../lib/general/extensions/color.dart';
import '../../lib/general/extensions/constants.dart';

void main() => test('Color to list int extension test',
    () async => expect(const IterableEquality<int>().equals(darkColor.toListInt(), [0, 0, 0]), true));
