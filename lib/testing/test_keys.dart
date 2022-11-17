import 'package:flutter/material.dart';

class TestKeys {
  // Onboarding related keys.
  static const Key colorsLoadInProgressIndicator = Key('colorsLoadInProgressIndicator');
  static const Key disappearedOnboard = Key('disappearedOnboard');
  static const Key emptyColorsContainer = Key('emptyColorsContainer');
  static const Key emptyDetailsContainer = Key('emptyDetailsContainer');
  static const Key emptyShareContainer = Key('emptyShareContainer');
  static const Key onboardingFinish = Key('onboardingFinish');

  // App-bar related keys.
  static const Key overflowMenuButton = Key('overflowMenuButton');
  static const Key settingsMenuItem = Key('settingsMenuItem');
  static const Key aboutMenuItem = Key('aboutMenuItem');

  // About app dialog related keys.
  static const Key viewLicensesButton = Key('viewLicensesButton');
  static const Key closeAboutDialogButton = Key('closeAboutDialogButton');

  // Settings dialog related keys.
  static const Key settingsDialogDropdownMenu = Key('settingsDialogDropdownMenu');
  static const Key resetSettingsButton = Key('resetSettingsButton');
  static const Key closeSettingsButton = Key('closeAboutDialogButton');

  static const Key systemThemeSelection = Key('systemThemeSelection');
  static const Key lightThemeSelection = Key('lightThemeSelection');
  static const Key darkThemeSelection = Key('darkThemeSelection');

  // Navigation bar related keys.
  static const Key shareTabButton = Key('shareTabButton');
  static const Key generateTabButton = Key('generateTabButton');
  static const Key favoritesTabButton = Key('favoritesTabButton');

  const TestKeys._();
}
