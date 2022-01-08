import 'package:colors_ai/core/services/clipboard.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../data/fakes/fake_clipboard.dart';

void main() => test('$ClipBoard', () async {
      const String dataToCopy = 'A';
      final ClipBoard fakeClipboard = FakeClipboard();
      await fakeClipboard.copyTextData(dataToCopy);
      final String? clipboardData = await fakeClipboard.data;
      expect(clipboardData, dataToCopy);
    });
