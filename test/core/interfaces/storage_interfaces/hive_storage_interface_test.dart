import 'package:colors_ai/core/interfaces/storage_interfaces/hive_storage_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

import '../../../data/fakes/fake_hive_box.dart';
import '../../../data/helpers/utils.dart';

class _HiveStorageInterfaceTest extends HiveStorageInterface<Object> {
  const _HiveStorageInterfaceTest(String boxName, [Box<Object>? box]) : super(null, boxName: boxName, openedBox: box);

  @override
  Future<void> doMigration(Object? oldData) async {}
}

void main() => group('HiveStorageInterface', () {
      const String boxName = 'box';
      final Box<Object> fakeBox = FakeHiveBox<Object>.empty();
      final _HiveStorageInterfaceTest hiveStorage = _HiveStorageInterfaceTest(boxName, fakeBox);
      test('boxName', () => expect(hiveStorage.boxName, boxName));
      test('openBox opened box', () async => expect(await hiveStorage.openBox, fakeBox));

      test(
        'openBox unopened box',
        () async {
          createFakeStorageDir();
          expect((await const _HiveStorageInterfaceTest(boxName).openBox).isOpen, true);
        },
      );

      tearDownAll(deleteFakeStorageDir);
    });
