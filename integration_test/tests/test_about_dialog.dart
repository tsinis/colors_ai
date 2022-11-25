// ignore_for_file: avoid_relative_lib_imports, prefer-moving-to-variable

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../lib/core/ui/constants.dart';
import '../../lib/main.dart';
import '../../lib/testing/test_keys.dart';
import '../helpers/extensions/key_extensions.dart';
import '../helpers/extensions/tester_extensions.dart';

void aboutDialogTest() =>
    testWidgets('About menu should show info about the app and license page', (WidgetTester tester) async {
      await main();
      final Finder mainBoard = await tester.pumpUntilFound(TestKeys.disappearedOnboard.finder);
      await tester.ensureVisible(mainBoard);
      expect(mainBoard, findsOneWidget, reason: 'Onboarding has been completed');

      final Finder overflowMenu = TestKeys.overflowMenuButton.finder;
      expect(overflowMenu, findsOneWidget);
      await tester.tapAndSettle(overflowMenu);

      expect(TestKeys.settingsMenuItem.finder, findsOneWidget);

      final Finder aboutMenuItem = TestKeys.aboutMenuItem.finder;
      expect(aboutMenuItem, findsOneWidget);

      await tester.pump();
      await tester.ensureVisible(aboutMenuItem);
      await tester.tap(aboutMenuItem);

      final Finder appNameText = find.text(kAppName);

      Finder appName = await tester.pumpUntilFound(appNameText);
      expect(appName, findsOneWidget);

      final Finder viewLicensesButton = TestKeys.viewLicensesButton.finder;
      await tester.ensureVisible(viewLicensesButton);
      await tester.tapAndSettle(viewLicensesButton);

      appName = await tester.pumpUntilFound(appNameText);
      expect(appName, findsOneWidget);

      final Finder closeButtonText = TestKeys.closeAboutDialogButton.finder;
      expect(closeButtonText, findsNothing, reason: 'It is not a dialog, but license page');

      final Finder licensePage = find.byType(LicensePage);
      final Finder backButton = find.byType(BackButton);
      expect(licensePage, findsOneWidget);
      expect(backButton, findsOneWidget);
      expect(appName, findsOneWidget);
      await tester.tapAndSettle(backButton);

      expect(closeButtonText, findsOneWidget, reason: 'It is not a license page anymore');
      await tester.tapAndSettle(closeButtonText);

      expect(appName, findsNothing, reason: 'About Dialog is closed');
      expect(licensePage, findsNothing);
    });
