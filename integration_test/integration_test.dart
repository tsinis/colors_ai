// ignore_for_file: avoid_relative_lib_imports

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../lib/core/ui/constants.dart';
import '../lib/main.dart' as app;
import '../lib/testing/test_keys.dart';
import 'helpers/extensions/tester_extensions.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Onboarding should disappear after tap on green button', (WidgetTester tester) async {
    await app.main();
    final Finder button = await tester.pumpUntilFound(find.byKey(TestKeys.onboardingFinish));
    final Finder disappear = find.byKey(TestKeys.disappearedOnboard);

    await tester.ensureVisible(button);
    expect(button, findsOneWidget, reason: 'We did NOT taped the button yet');
    expect(disappear, findsNothing);

    await tester.tap(button);
    await tester.pumpAndSettle();

    expect(button, findsNothing, reason: 'We DID taped the button');
    expect(disappear, findsOneWidget);
  });

  testWidgets('About menu should show info about the app', (WidgetTester tester) async {
    await app.main();
    final Finder mainBoard = await tester.pumpUntilFound(find.byKey(TestKeys.disappearedOnboard));
    await tester.ensureVisible(mainBoard);
    expect(mainBoard, findsOneWidget, reason: 'Onboarding has been completed');

    final Finder overflowMenu = find.byKey(TestKeys.overflowMenuButton);
    expect(overflowMenu, findsOneWidget);

    await tester.tap(overflowMenu);
    await tester.pumpAndSettle();

    final Finder settingsMenuItem = find.byKey(TestKeys.settingsMenuItem);
    expect(settingsMenuItem, findsOneWidget);

    final Finder aboutMenuItem = find.byKey(TestKeys.aboutMenuItem);
    expect(aboutMenuItem, findsOneWidget);

    await tester.pump();
    await tester.ensureVisible(aboutMenuItem);
    await tester.tap(aboutMenuItem);

    final Finder appName = await tester.pumpUntilFound(find.text(kAppName));
    expect(appName, findsOneWidget);
  });
}
