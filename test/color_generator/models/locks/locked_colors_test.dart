import 'package:colors_ai/color_generator/models/locks/locked_colors.dart';
import 'package:flutter_test/flutter_test.dart';

class _LockedColorsTest extends LockedColors {
  const _LockedColorsTest(List<bool> lockedColors) : super(list: lockedColors);
}

void main() => group('$LockedColors', () {
      late List<bool> list;
      late LockedColors lockedColors;

      setUp(() {
        list = <bool>[false, true];
        lockedColors = _LockedColorsTest(list);
      });

      test('list', () => expect(lockedColors.list, list));

      test('props', () => expect(lockedColors.props, list));

      test('unlockAll()', () {
        lockedColors.unlockAll();
        expect(lockedColors, const _LockedColorsTest(<bool>[false, false]));
      });

      test('lock() with valid index', () {
        lockedColors.lock(0);
        expect(lockedColors, const _LockedColorsTest(<bool>[true, true]));
      });

      test('lock() with invalid index', () {
        lockedColors.lock(list.length);
        expect(lockedColors, const _LockedColorsTest(<bool>[false, true]));
      });

      test('add()', () {
        lockedColors.add(false);
        expect(lockedColors, const _LockedColorsTest(<bool>[false, true, false]));
      });

      test('addAll()', () {
        final List<bool> anotherList = <bool>[true, false];
        lockedColors.addAll(anotherList);
        expect(lockedColors, _LockedColorsTest(anotherList));
      });

      test('change() with valid index', () {
        lockedColors.change(0, true);
        expect(lockedColors, const _LockedColorsTest(<bool>[true, true]));
      });

      test('change() with invalid index', () {
        lockedColors.change(list.length, true);
        expect(lockedColors, _LockedColorsTest(list));
      });

      test('swap() with new index equal or less than list length', () {
        lockedColors
          ..add(false)
          ..swap(oldIndex: 0, newIndex: list.length - 1);
        expect(lockedColors, const _LockedColorsTest(<bool>[true, false, false]));
      });

      test('swap() with new index greater than list length', () {
        lockedColors.swap(oldIndex: 0, newIndex: list.length + 1);
        expect(lockedColors, const _LockedColorsTest(<bool>[true, false]));
      });
    });
