import 'package:colors_ai/color_generator/interfaces/manipulate_list_interface.dart';
import 'package:flutter_test/flutter_test.dart';

class _ManipulateListInterfaceTest extends ManipulateListInterface<bool> {
  const _ManipulateListInterfaceTest(super.list);
}

void main() => group('ManipulateListInterface', () {
      late List<bool> list;
      late ManipulateListInterface<bool> manipulateList;

      setUp(() {
        list = <bool>[false, true];
        manipulateList = _ManipulateListInterfaceTest(list);
      });

      test('list', () => expect(manipulateList.list, list));

      test('props', () => expect(manipulateList.props, list));

      test('add()', () {
        manipulateList.add(false);
        expect(manipulateList, const _ManipulateListInterfaceTest(<bool>[false, true, false]));
      });

      test('addAll()', () {
        final List<bool> anotherList = <bool>[true, false];
        manipulateList.addAll(anotherList);
        expect(manipulateList, _ManipulateListInterfaceTest(anotherList));
      });

      test('change() with valid index', () {
        manipulateList.change(0, true);
        expect(manipulateList, const _ManipulateListInterfaceTest(<bool>[true, true]));
      });

      test('change() with invalid index', () {
        manipulateList.change(list.length, true);
        expect(manipulateList, _ManipulateListInterfaceTest(list));
      });

      test('swap() with new index equal or less than list length', () {
        manipulateList
          ..add(false)
          ..swap(oldIndex: 0, newIndex: list.length - 1);
        expect(manipulateList, const _ManipulateListInterfaceTest(<bool>[true, false, false]));
      });

      test('swap() with new index greater than list length', () {
        manipulateList.swap(oldIndex: 0, newIndex: list.length + 1);
        expect(manipulateList, const _ManipulateListInterfaceTest(<bool>[true, false]));
      });
    });
