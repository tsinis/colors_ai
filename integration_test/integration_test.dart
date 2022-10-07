// ignore_for_file: long-method, avoid_relative_lib_imports

import 'package:colors_ai/share/services/url_providers/colors_url_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../lib/core/extensions/string_extension.dart';
import '../lib/core/ui/constants.dart';
import '../lib/main.dart' as app;
import '../lib/settings/models/selected_api.dart';
import '../lib/testing/test_keys.dart';
import 'helpers/extensions/tester_extensions.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Onboarding should disappear after tap on green button', (WidgetTester tester) async {
    await app.main();
    final Finder button = await tester.pumpUntilFound(find.byKey(TestKeys.onboardingFinish));
    final Finder disappear = find.byKey(TestKeys.disappearedOnboard);

    await tester.ensureVisible(button);
    expect(button, findsOneWidget, reason: 'Did NOT taped the button yet');
    expect(disappear, findsNothing);

    await tester.tap(button);
    await tester.pumpAndSettle();

    expect(button, findsNothing, reason: 'DID taped the button');
    expect(disappear, findsOneWidget);
  });

  testWidgets('About menu should show info about the app and license page', (WidgetTester tester) async {
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

    final Finder appNameText = find.text(kAppName);

    Finder appName = await tester.pumpUntilFound(appNameText);
    expect(appName, findsOneWidget);

    final Finder viewLicensesButton = find.byKey(TestKeys.viewLicensesButton);
    await tester.ensureVisible(viewLicensesButton);
    await tester.tap(viewLicensesButton);
    await tester.pumpAndSettle();

    appName = await tester.pumpUntilFound(appNameText);
    expect(appName, findsOneWidget);

    final Finder closeButtonText = find.byKey(TestKeys.closeAboutDialogButton);
    expect(closeButtonText, findsNothing, reason: 'It is not a dialog, but license page');

    final Finder licensePage = find.byType(LicensePage);
    final Finder backButton = find.byType(BackButton);
    expect(licensePage, findsOneWidget);
    expect(backButton, findsOneWidget);
    expect(appName, findsOneWidget);
    await tester.tap(backButton);
    await tester.pumpAndSettle();

    expect(closeButtonText, findsOneWidget, reason: 'It is not a license page anymore');
    await tester.tap(closeButtonText);
    await tester.pumpAndSettle();

    expect(appName, findsNothing, reason: 'About Dialog is closed');
  });

  testWidgets('Settings menu should show Colormind as default and theme switcher', (WidgetTester tester) async {
    await app.main();

    final Finder overflowMenu = await tester.pumpUntilFound(find.byKey(TestKeys.overflowMenuButton));
    expect(overflowMenu, findsOneWidget);

    await tester.tap(overflowMenu);

    final Finder settingsMenuItem = await tester.pumpUntilFound(find.byKey(TestKeys.settingsMenuItem));
    expect(settingsMenuItem, findsOneWidget);
    await tester.pumpAndSettle();
    await tester.ensureVisible(settingsMenuItem);
    await tester.tap(settingsMenuItem);

    final Finder colormindText = find.text(SelectedAPI.colormind.name.toBeginningOfSentenceCase());

    final Finder colormind = await tester.pumpUntilFound(colormindText);
    expect(colormind, findsOneWidget);

    final Finder menuFinder = find.byKey(TestKeys.settingsDialogDropdownMenu);

    final Color lightThemeColor = Colors.grey.shade300;

    DropdownButtonFormField<SelectedAPI> dropdownMenu = tester.widget<DropdownButtonFormField<SelectedAPI>>(menuFinder);
    expect(dropdownMenu.decoration.fillColor, lightThemeColor);

    final Finder darkThemeSwitcher = find.byKey(TestKeys.darkThemeSelection);

    RadioListTile<bool?> darkThemeSelection = tester.widget<RadioListTile<bool?>>(
      darkThemeSwitcher,
    );

    await tester.pumpAndSettle();
    await tester.ensureVisible(darkThemeSwitcher);
    expect(darkThemeSelection.groupValue, isNull);

    await tester.tap(darkThemeSwitcher);
    await tester.pumpAndSettle();

    darkThemeSelection = tester.widget<RadioListTile<bool?>>(darkThemeSwitcher);
    expect(darkThemeSelection.groupValue, isTrue);

    dropdownMenu = tester.widget<DropdownButtonFormField<SelectedAPI>>(menuFinder);
    expect(dropdownMenu.decoration.fillColor, isNot(lightThemeColor));
  });

  testWidgets('Share tab should show ${const ArtsGoogle().name} as default provider', (WidgetTester tester) async {
    await app.main();

    final Finder shareTabIcon = await tester.pumpUntilFound(find.byKey(TestKeys.shareTabButton));
    expect(shareTabIcon, findsOneWidget);

    await tester.tap(shareTabIcon);

    final Finder defaultProvider = await tester.pumpUntilFound(find.text(const ArtsGoogle().name));
    expect(defaultProvider, findsOneWidget);
  });
}
