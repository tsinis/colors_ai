import 'package:flutter_test/flutter_test.dart';

import '../data/fakes/fake_hive_box.dart';

void verifyNoBoxInteractions(FakeHiveBox<Object> fakeBox, {bool shouldBeEmpty = true, bool shouldBeOpen = false}) {
  expect(fakeBox.isEmpty, shouldBeEmpty);
  expect(fakeBox.isOpen, shouldBeOpen);
}
