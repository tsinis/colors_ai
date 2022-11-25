// ignore_for_file: avoid_relative_lib_imports

import 'package:flutter_test/flutter_test.dart';

import '../../lib/main.dart';
import '../../lib/testing/test_keys.dart';
import '../helpers/extensions/key_extensions.dart';
import '../helpers/extensions/tester_extensions.dart';

void onboardingTest() =>
    testWidgets('Onboarding should disappear after tap on green button', (WidgetTester tester) async {
      await main();
      final Finder button = await tester.pumpUntilFound(TestKeys.onboardingFinish.finder);
      final Finder disappear = TestKeys.disappearedOnboard.finder;

      await tester.ensureVisible(button);
      expect(button, findsOneWidget, reason: 'Did NOT taped the button yet');
      expect(disappear, findsNothing);

      await tester.tapAndSettle(button);

      expect(button, findsNothing, reason: 'DID taped the button');
      expect(disappear, findsOneWidget);
    });
