import 'package:colors_ai/flutter_colors_ai_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
// ignore: avoid_relative_lib_imports
import '../lib/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('onboarding should dissapear after tap on "GOT IT" button', (tester) async {
    app.main();
    debugPrint('App is started');
    try {
      await tester.pumpAndSettle(
          const Duration(milliseconds: 100), EnginePhase.sendSemanticsUpdate, const Duration(seconds: 5));
      // ignore: avoid_catches_without_on_clauses
    } catch (expection) {
      debugPrint(
          'Expection is: $expection. Because: Infinity loop "Pull to refresh" animation is showed, cannot wait till settle');
    }
    debugPrint('App is pumped');
    final button = find.byKey(FlutterColorsAIKeys.onboardingFinish);
    debugPrint('Described BUTTON: $button');
    final dissapear = find.byKey(FlutterColorsAIKeys.disappearedOnboard);
    debugPrint('Described DISSAPEAR: $dissapear');
    await tester.ensureVisible(button);
    debugPrint('Ensured button is visible');
    expect(button, findsOneWidget, reason: 'We did not taped yet');
    expect(dissapear, findsNothing);

    await tester.tap(button);
    debugPrint('Button is taped');
    await tester.pump();
    debugPrint('App is pumped again');
    expect(button, findsNothing, reason: 'We DID taped the button');
    expect(dissapear, findsOneWidget);
    debugPrint('Test Finished, result is:');
  });
}
