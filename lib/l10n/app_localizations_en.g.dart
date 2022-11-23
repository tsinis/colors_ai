import 'package:intl/intl.dart' as intl;

import 'app_localizations.g.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get aboutGenerator => 'Color scheme generator that uses deep learning from';

  @override
  String get aboutSourceCode => 'The source code of this application is available at';

  @override
  String get aboutSourceRepository => 'this GitHub repository';

  @override
  String get aboutAttribution => 'Attribution';

  @override
  String get aboutSounds => 'UI sounds used in this application:';

  @override
  String get aboutByGoogle => 'by';

  @override
  String get aboutSoundsLicense => 'are licensed under';

  @override
  String get aboutThisAppTooltip => 'About this app';

  @override
  String get noConnectionTitle => 'Oh no!';

  @override
  String get noConnectionDescription => 'Unable to connect to AI server.';

  @override
  String get returnButtonLabel => 'Return';

  @override
  String get noFavoritesTitle => 'Oops!';

  @override
  String get noFavoritesDescription => 'Favorite Palettes list is empty now.';

  @override
  String get addFavoritesButtonLabel => 'Add some';

  @override
  String get removeAllTitle => 'Remove all favorite palettes';

  @override
  String get removeButtonLabel => 'Remove';

  @override
  String get urlCopiedMessage => 'Link copied!';

  @override
  String get urlOpenButtonLabel => 'Open';

  @override
  String colorCopiedMessage(Object colorHexValue) {

    return 'Color $colorHexValue copied!';
  }

  @override
  String get serverMaintenanceMessage => 'The server is updated at midnight PDT, so it may be unavailable for 30 sec.';

  @override
  String get shareFailedMessage => 'Failed to share, try another type.';

  @override
  String get removeFavoritesTip => 'Tap on the row to restore colors.\nSwipe right/left to remove them.';

  @override
  String get pullToRefreshTip => 'Pull down to refresh';

  @override
  String get onboardingLockTip => 'Double tap anywhere to lock the color';

  @override
  String get onboardingSelectTip => 'Tap on the left part to select a color';

  @override
  String get onboardingMoveTip => 'The position of the colors does\nmatter, hold & drag to reorder them';

  @override
  String get onboardingGenerateTip => 'Pull down to generate new colors';

  @override
  String get onboardingSaveTip => 'Tap the button below to save your colors';

  @override
  String get onboardingDoneButtonLabel => 'Got it!';

  @override
  String get shareTabLabel => 'Share Palette';

  @override
  String get generateTabLabel => 'Generate Palette';

  @override
  String get noFavoritesTabLabel => 'No Favorite Palettes';

  @override
  String get favoritesTabLabel => 'Favorite Palettes';

  @override
  String get shareLinksLabel => 'Share a link via:';

  @override
  String get googleArtsExport => 'Arts that match your colors';

  @override
  String get exportTo => 'Export to:';

  @override
  String get copyUrlButtonLabel => 'Copy URL';

  @override
  String get shareUrlButtonLabel => 'Share URL';

  @override
  String get a4DimensionsTitle => '210 by 297 millimeters';

  @override
  String get a4DimensionsSubtitle => 'International ISO 216 Standard';

  @override
  String get letterLabel => 'US Letter';

  @override
  String get letterDimensionsTitle => '8.5 by 11 inches';

  @override
  String get letterDimensionsSubtitle => 'North American ANSI Standard';

  @override
  String get sharePngButtonLabel => 'Share PNG';

  @override
  String get sharePdfButtonLabel => 'Share PDF';

  @override
  String get unlockAllColors => 'Unlock all colors';

  @override
  String get savePaletteToFavorites => 'Save this palette to favorites';

  @override
  String favoritePaletteSematic(Object paletteIndex) {

    return 'Favorite color palette number: $paletteIndex';
  }

  @override
  String removeSomeTitle(num count) {
    String _removeSomeTitle0(num count) {
      return 'Remove $count palettes';
    }

    String _removeSomeTitle1(num count) {
      return 'Remove $count palette';
    }

    String _removeSomeTitle2(num count) {
      return intl.Intl.pluralLogic(
        count,
        locale: localeName,
      other: _removeSomeTitle0(count),
      one: _removeSomeTitle1(count),
      );
    }
    return _removeSomeTitle2(count);
  }

  @override
  String get addToFavorites => 'Add to Favorites';

  @override
  String get removeFavoritesTipLandscape => 'Press on the palette to restore colors.\nPress on the text label to copy HEX value';

  @override
  String get removeFavoritesTooltip => 'Remove this palette';

  @override
  String get selectToRemoveFavoritesTooltip => 'Select this palette to remove';

  @override
  String get onboardingGenerateTipLandscape => 'Press Spacebar on keyboard to generate new colors';

  @override
  String get onboardingSelectTipLandscape => 'Press anywhere (outside the lock zone) to select a color';

  @override
  String get onboardingSaveTipLandscape => 'Press the button at the top left of the screen to save colors';

  @override
  String get shareFile => 'Share file as:';

  @override
  String copyAsFormat(Object fileFormat) {

    return 'Copy $fileFormat';
  }

  @override
  String shareAsFormat(Object fileFormat) {

    return 'Share $fileFormat';
  }

  @override
  String get settings => 'Settings';

  @override
  String get help => 'Help';

  @override
  String get colorsForUiTitle => 'Colors for UI';

  @override
  String get colorsForUiSubtitle => 'Improve color generation for UI design';

  @override
  String get appearance => 'Appearance:';

  @override
  String get lightThemeTitle => 'Light';

  @override
  String get lightThemeSubtitle => 'Neutral grey, non-contrast UI for light designs';

  @override
  String get darkThemeTitle => 'Dark';

  @override
  String get darkThemeSubtitle => 'Pitch grey UI, perfect for dark themed designs';

  @override
  String get systemThemeTitle => 'System';

  @override
  String get systemThemeSubtitle => 'Use device theme brightness';

  @override
  String get resetButtonLabel => 'Reset';

  @override
  String formatCopied(Object fileFormat) {

    return '$fileFormat content copied!';
  }

  @override
  String get invalidHexErrorLabel => 'Invalid Hex code pasted';

  @override
  String get hexHintTextLabel => 'Hex color code';

  @override
  String get and => 'and';

  @override
  String get selectAiProvider => 'Select AI colors provider:';

  @override
  String get colormindApiDescription => 'Older, heavily used, has network issues';

  @override
  String get huemintApiDescription => 'Brand new, less known so less popular';

  @override
  String get adjacency => 'Adjacency (contrast between colors)';

  @override
  String get temperature => 'Creativity (sampling temperature)';

  @override
  String get vibrationsTitle => 'Vibrations';

  @override
  String get vibrationsLabel => 'Enable or disable haptic feedback';
}
