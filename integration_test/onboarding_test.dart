import 'package:flutter/foundation.dart' show debugPrint;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

// ignore_for_file: avoid_relative_lib_imports
import '../lib/main.dart' as app;
import '../lib/testing/test_keys.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Onboarding should disappear after tap on "GOT IT" button', (WidgetTester tester) async {
    await app.main();
    debugPrint('App is started');
    try {
      await tester.pumpAndSettle(
        const Duration(seconds: 2),
        EnginePhase.sendSemanticsUpdate,
        const Duration(seconds: 5),
      );
    } catch (exception) {
      debugPrint(
        'Exception is: $exception. Because: Infinity loop "Pull to refresh" animation is showed, cannot wait till settle',
      );
    }
    await tester.pump(const Duration(seconds: 2));
    await tester.pump();
    debugPrint('App is pumped');
    final Finder button = find.byKey(TestKeys.onboardingFinish);
    debugPrint('Described BUTTON: $button');
    final Finder disappear = find.byKey(TestKeys.disappearedOnboard);
    debugPrint('Described DISAPPEAR: $disappear');
    await tester.ensureVisible(button);
    debugPrint('Ensured button is visible');
    expect(button, findsOneWidget, reason: 'We did not taped yet');
    expect(disappear, findsNothing);

    await tester.tap(button);
    await tester.pump();
    expect(button, findsNothing, reason: 'We DID taped the button');
    expect(disappear, findsOneWidget);
  });
}
