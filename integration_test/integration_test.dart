import 'package:integration_test/integration_test.dart';

import 'tests/test_about_dialog.dart';
import 'tests/test_onboarding.dart';
import 'tests/test_settings_menu.dart';
import 'tests/test_share_tab.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  onboardingTest();

  aboutDialogTest();

  settingsMenuTest();

  shareTabTest();
}
