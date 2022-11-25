// ignore_for_file: avoid_relative_lib_imports

import 'package:flutter_test/flutter_test.dart';

import '../../lib/main.dart';
import '../../lib/share/services/url_providers/colors_url_provider.dart';
import '../../lib/testing/test_keys.dart';
import '../helpers/extensions/key_extensions.dart';
import '../helpers/extensions/tester_extensions.dart';

void shareTabTest() =>
    testWidgets('Share tab should show ${const ArtsGoogle().name} as default provider', (WidgetTester tester) async {
      await main();

      final Finder shareTabIcon = await tester.pumpUntilFound(TestKeys.shareTabButton.finder);
      expect(shareTabIcon, findsOneWidget);

      await tester.tap(shareTabIcon);

      final Finder defaultProvider = await tester.pumpUntilFound(find.text(const ArtsGoogle().name));
      expect(defaultProvider, findsOneWidget);
    });
