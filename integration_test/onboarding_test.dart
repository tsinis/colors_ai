import 'package:colors_ai/flutter_colors_ai_keys.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:integration_test/integration_test.dart';
// ignore: avoid_relative_lib_imports
import '../lib/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('onboarding should dissapear after tap on "GOT IT" button', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    final button = find.byKey(FlutterColorsAIKeys.onboardingFinish);
    final dissapear = find.byKey(FlutterColorsAIKeys.disappearedOnboard);

    expect(button, findsOneWidget);
    expect(dissapear, findsNothing);

    await tester.tap(button);
    await tester.pump();

    expect(button, findsNothing);
    expect(dissapear, findsOneWidget);
  });
}
