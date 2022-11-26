// ignore_for_file: avoid_relative_lib_imports, prefer-moving-to-variable

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../lib/core/extensions/string_extension.dart';
import '../../lib/main.dart';
import '../../lib/settings/models/selected_api.dart';
import '../../lib/testing/test_keys.dart';
import '../helpers/extensions/key_extensions.dart';
import '../helpers/extensions/tester_extensions.dart';

void settingsMenuTest() =>
    testWidgets('Settings menu should show Colormind as default and theme switcher', (WidgetTester tester) async {
      await main();

      final Finder overflowMenu = await tester.pumpUntilFound(TestKeys.overflowMenuButton.finder);
      expect(overflowMenu, findsOneWidget);

      await tester.tapAndSettle(overflowMenu);

      final Finder settingsMenuItem = await tester.pumpUntilFound(TestKeys.settingsMenuItem.finder);
      expect(settingsMenuItem, findsOneWidget);

      await tester.ensureVisible(settingsMenuItem);
      await tester.tapAndSettle(settingsMenuItem);

      final Finder dialog = find.byType(AlertDialog);
      expect(dialog, findsOneWidget);

      final Finder colormindText = find.text(SelectedAPI.colormind.name.toBeginningOfSentenceCase());
      final Finder colormind = await tester.pumpUntilFound(colormindText);
      expect(colormind, findsOneWidget);

      final Finder colorsForUiSwitch = find.byType(Switch);
      expect(colorsForUiSwitch, findsWidgets, reason: 'It is a switch presented in Colormind but not in the Huemint');
      await tester.tapAndSettle(colorsForUiSwitch);

      final Finder menuFinder = TestKeys.settingsDialogDropdownMenu.finder;

      final Color lightThemeColor = Colors.grey.shade300;

      DropdownButtonFormField<SelectedAPI> dropdownMenu =
          tester.widget<DropdownButtonFormField<SelectedAPI>>(menuFinder);
      expect(dropdownMenu.decoration.fillColor, lightThemeColor);

      final Finder darkThemeSwitcher = TestKeys.darkThemeSelection.finder;

      RadioListTile<bool?> darkThemeSelection = tester.widget<RadioListTile<bool?>>(
        darkThemeSwitcher,
      );

      await tester.ensureVisible(darkThemeSwitcher);
      expect(darkThemeSelection.groupValue, isNull);

      await tester.tapAndSettle(darkThemeSwitcher);

      darkThemeSelection = tester.widget<RadioListTile<bool?>>(darkThemeSwitcher);
      expect(darkThemeSelection.groupValue, isTrue);

      dropdownMenu = tester.widget<DropdownButtonFormField<SelectedAPI>>(menuFinder);
      expect(dropdownMenu.decoration.fillColor, isNot(lightThemeColor), reason: 'Selected dark theme');

      await tester.tapAndSettle(TestKeys.resetSettingsButton.finder);
      dropdownMenu = tester.widget<DropdownButtonFormField<SelectedAPI>>(menuFinder);
      darkThemeSelection = tester.widget<RadioListTile<bool?>>(darkThemeSwitcher);
      expect(dropdownMenu.decoration.fillColor, lightThemeColor, reason: 'Reset theme settings to default system one');
      expect(darkThemeSelection.groupValue, isNull);

      await tester.tapAndSettle(TestKeys.closeSettingsButton.finder);
      expect(dialog, findsNothing, reason: 'Dialog is closed now');
      expect(colorsForUiSwitch, findsNothing);
    });
