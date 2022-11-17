import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_cs.g.dart';
import 'app_localizations_en.g.dart';
import 'app_localizations_ru.g.dart';
import 'app_localizations_sk.g.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.g.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('cs'),
    Locale('en'),
    Locale('ru'),
    Locale('sk')
  ];

  /// App description in about dialog, followed by API name.
  ///
  /// In en, this message translates to:
  /// **'Color scheme generator that uses deep learning from'**
  String get aboutGenerator;

  /// App source code description in about dialog, followed by repository provider name.
  ///
  /// In en, this message translates to:
  /// **'The source code of this application is available at'**
  String get aboutSourceCode;

  /// App source repository description in about dialog with the URL link.
  ///
  /// In en, this message translates to:
  /// **'this GitHub repository'**
  String get aboutSourceRepository;

  /// App attribution header in about dialog.
  ///
  /// In en, this message translates to:
  /// **'Attribution'**
  String get aboutAttribution;

  /// App sounds attribution in about dialog.
  ///
  /// In en, this message translates to:
  /// **'UI sounds used in this application:'**
  String get aboutSounds;

  /// App Google attribution at about dialog.
  ///
  /// In en, this message translates to:
  /// **'by'**
  String get aboutByGoogle;

  /// App sounds license description in about dialog.
  ///
  /// In en, this message translates to:
  /// **'are licensed under'**
  String get aboutSoundsLicense;

  /// Tooltip used for "About app" icon.
  ///
  /// In en, this message translates to:
  /// **'About this app'**
  String get aboutThisAppTooltip;

  /// Title of the message on the main screen, when no connection with the server is available.
  ///
  /// In en, this message translates to:
  /// **'Oh no!'**
  String get noConnectionTitle;

  /// Description of the message on the main screen, when no connection with the server is available.
  ///
  /// In en, this message translates to:
  /// **'Unable to connect to AI server.'**
  String get noConnectionDescription;

  /// Label of the button on the main screen, when no connection with the server is available.
  ///
  /// In en, this message translates to:
  /// **'Return'**
  String get returnButtonLabel;

  /// Title of the message on favorites screen, where there are no favorite palettes.
  ///
  /// In en, this message translates to:
  /// **'Oops!'**
  String get noFavoritesTitle;

  /// Description of the message on favorites screen, where there are no favorite palettes.
  ///
  /// In en, this message translates to:
  /// **'Favorite Palettes list is empty now.'**
  String get noFavoritesDescription;

  /// Label of the button, to add favorite palette when there are no favorite palettes available.
  ///
  /// In en, this message translates to:
  /// **'Add some'**
  String get addFavoritesButtonLabel;

  /// Title of pop-up dialog, when removing all stored favorite palettes.
  ///
  /// In en, this message translates to:
  /// **'Remove all favorite palettes'**
  String get removeAllTitle;

  /// Label of the remove text-button in "Remove all favorite palettes" dialog.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get removeButtonLabel;

  /// Label of snack bar message, after success URL copy.
  ///
  /// In en, this message translates to:
  /// **'Link copied!'**
  String get urlCopiedMessage;

  /// Label of snack bar action, after success URL copy.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get urlOpenButtonLabel;

  /// Label of snack bar action, after success color value copy.
  ///
  /// In en, this message translates to:
  /// **'Color {colorHexValue} copied!'**
  String colorCopiedMessage(Object colorHexValue);

  /// Label of snack bar message, after server maintenance detected.
  ///
  /// In en, this message translates to:
  /// **'The server is updated at midnight PDT, so it may be unavailable for 30 sec.'**
  String get serverMaintenanceMessage;

  /// Label of snack bar message, after failed share.
  ///
  /// In en, this message translates to:
  /// **'Failed to share, try another type.'**
  String get shareFailedMessage;

  /// Tip on the bottom of the favorites screen.
  ///
  /// In en, this message translates to:
  /// **'Tap on the row to restore colors.\nSwipe right/left to remove them.'**
  String get removeFavoritesTip;

  /// Tip on the bottom of the main screen, under the last tile.
  ///
  /// In en, this message translates to:
  /// **'Pull down to refresh'**
  String get pullToRefreshTip;

  /// Label on the first color tile, during onboarding.
  ///
  /// In en, this message translates to:
  /// **'Double tap anywhere to lock the color'**
  String get onboardingLockTip;

  /// Label on the second color tile, during onboarding.
  ///
  /// In en, this message translates to:
  /// **'Tap on the left part to select a color'**
  String get onboardingSelectTip;

  /// Label on the third color tile, during onboarding.
  ///
  /// In en, this message translates to:
  /// **'The position of the colors does\nmatter, hold & drag to reorder them'**
  String get onboardingMoveTip;

  /// Message under the fourth color tile, on the main screen.
  ///
  /// In en, this message translates to:
  /// **'Pull down to generate new colors'**
  String get onboardingGenerateTip;

  /// Message under the last color tile, on the main screen.
  ///
  /// In en, this message translates to:
  /// **'Tap the button below to save your colors'**
  String get onboardingSaveTip;

  /// Label on the "Done" button, during onboarding.
  ///
  /// In en, this message translates to:
  /// **'Got it!'**
  String get onboardingDoneButtonLabel;

  /// Tooltip on the first tab of the bottom navigation bar.
  ///
  /// In en, this message translates to:
  /// **'Share Palette'**
  String get shareTabLabel;

  /// Tooltip on the second tab of the bottom navigation bar.
  ///
  /// In en, this message translates to:
  /// **'Generate Palette'**
  String get generateTabLabel;

  /// Tooltip on the last tab of the bottom navigation bar, when there are no favorite pallets saved.
  ///
  /// In en, this message translates to:
  /// **'No Favorite Palettes'**
  String get noFavoritesTabLabel;

  /// Tooltip on the last tab of the bottom navigation bar.
  ///
  /// In en, this message translates to:
  /// **'Favorite Palettes'**
  String get favoritesTabLabel;

  /// Label of the dropdown menu, on share tab.
  ///
  /// In en, this message translates to:
  /// **'Share a link via:'**
  String get shareLinksLabel;

  /// Hint under dropdown menu, on share tab, when first URL provider selected.
  ///
  /// In en, this message translates to:
  /// **'Arts that match your colors'**
  String get googleArtsExport;

  /// Hint under dropdown menu, on share tab, when URL provider has some export options.
  ///
  /// In en, this message translates to:
  /// **'Export to:'**
  String get exportTo;

  /// Label on the top left button on share tab.
  ///
  /// In en, this message translates to:
  /// **'Copy URL'**
  String get copyUrlButtonLabel;

  /// Label on the top right button on share tab.
  ///
  /// In en, this message translates to:
  /// **'Share URL'**
  String get shareUrlButtonLabel;

  /// Title of the top radio button list tile, on share tab.
  ///
  /// In en, this message translates to:
  /// **'210 by 297 millimeters'**
  String get a4DimensionsTitle;

  /// Subtitle of the top radio button list tile, on share tab.
  ///
  /// In en, this message translates to:
  /// **'International ISO 216 Standard'**
  String get a4DimensionsSubtitle;

  /// Label of the bottom radio button list tile, on share tab.
  ///
  /// In en, this message translates to:
  /// **'US Letter'**
  String get letterLabel;

  /// Title of the bottom radio button list tile, on share tab.
  ///
  /// In en, this message translates to:
  /// **'8.5 by 11 inches'**
  String get letterDimensionsTitle;

  /// Subtitle of the bottom radio button list tile, on share tab.
  ///
  /// In en, this message translates to:
  /// **'North American ANSI Standard'**
  String get letterDimensionsSubtitle;

  /// Label on the bottom left button on share tab.
  ///
  /// In en, this message translates to:
  /// **'Share PNG'**
  String get sharePngButtonLabel;

  /// Label on the bottom right button on share tab.
  ///
  /// In en, this message translates to:
  /// **'Share PDF'**
  String get sharePdfButtonLabel;

  /// Label on the top right lock icon, at the main screen.
  ///
  /// In en, this message translates to:
  /// **'Unlock all colors'**
  String get unlockAllColors;

  /// Semantic label of the floating action button.
  ///
  /// In en, this message translates to:
  /// **'Save this palette to favorites'**
  String get savePaletteToFavorites;

  /// Semantic label of favorite palette at favorites tab
  ///
  /// In en, this message translates to:
  /// **'Favorite color palette number: {paletteIndex}'**
  String favoritePaletteSematic(Object paletteIndex);

  /// Title of pop-up dialog and app bar, when removing some stored favorite palettes.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{Remove {count} palette}  other{Remove {count} palettes}}'**
  String removeSomeTitle(num count);

  /// Tooltip of floating action button that's saving palette to Favorites
  ///
  /// In en, this message translates to:
  /// **'Add to Favorites'**
  String get addToFavorites;

  /// Tip on the bottom of the favorites screen, in landscape mode.
  ///
  /// In en, this message translates to:
  /// **'Press on the palette to restore colors.\nPress on the text label to copy HEX value'**
  String get removeFavoritesTipLandscape;

  /// Tooltip on the trash icon button at Favorites screen in landscape mode.
  ///
  /// In en, this message translates to:
  /// **'Remove this palette'**
  String get removeFavoritesTooltip;

  /// Tooltip on the checkbox at Favorites screen in landscape mode.
  ///
  /// In en, this message translates to:
  /// **'Select this palette to remove'**
  String get selectToRemoveFavoritesTooltip;

  /// Message under the fourth color tile, on the main screen, in landscape mode.
  ///
  /// In en, this message translates to:
  /// **'Press Spacebar on keyboard to generate new colors'**
  String get onboardingGenerateTipLandscape;

  /// Label on the second color tile, during onboarding in landscape mode.
  ///
  /// In en, this message translates to:
  /// **'Press anywhere (outside the lock zone) to select a color'**
  String get onboardingSelectTipLandscape;

  /// Message under the last color tile, on the main screen.
  ///
  /// In en, this message translates to:
  /// **'Press the button at the top left of the screen to save colors'**
  String get onboardingSaveTipLandscape;

  /// Label of file share drop-down menu.
  ///
  /// In en, this message translates to:
  /// **'Share file as:'**
  String get shareFile;

  /// Label of copy file button on Share Tab.
  ///
  /// In en, this message translates to:
  /// **'Copy {fileFormat}'**
  String copyAsFormat(Object fileFormat);

  /// Label of share file button on Share Tab.
  ///
  /// In en, this message translates to:
  /// **'Share {fileFormat}'**
  String shareAsFormat(Object fileFormat);

  /// Label of Settings Menu.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Label of Help Menu in Overflow menu.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// Label of switch tile in the settings menu.
  ///
  /// In en, this message translates to:
  /// **'Colors for UI'**
  String get colorsForUiTitle;

  /// Description of switch tile in the settings menu.
  ///
  /// In en, this message translates to:
  /// **'Improve color generation for UI design'**
  String get colorsForUiSubtitle;

  /// Title below theme radio buttons.
  ///
  /// In en, this message translates to:
  /// **'Appearance:'**
  String get appearance;

  /// Title of the light theme radio button.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get lightThemeTitle;

  /// Subtitle of the light theme radio button.
  ///
  /// In en, this message translates to:
  /// **'Neutral grey, non-contrast UI for light designs'**
  String get lightThemeSubtitle;

  /// Title of the dark theme radio button.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get darkThemeTitle;

  /// Subtitle of the dark theme radio button.
  ///
  /// In en, this message translates to:
  /// **'Pitch grey UI, perfect for dark themed designs'**
  String get darkThemeSubtitle;

  /// Title of system theme radio button.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get systemThemeTitle;

  /// Subtitle of system theme radio button.
  ///
  /// In en, this message translates to:
  /// **'Use device theme brightness'**
  String get systemThemeSubtitle;

  /// Label of the right button on the settings dialog.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get resetButtonLabel;

  /// Snackbar message after success file content copy.
  ///
  /// In en, this message translates to:
  /// **'{fileFormat} content copied!'**
  String formatCopied(Object fileFormat);

  /// Error message below text field in the color-picker dialog.
  ///
  /// In en, this message translates to:
  /// **'Invalid Hex code pasted'**
  String get invalidHexErrorLabel;

  /// Hint text on the text field in the color-picker dialog.
  ///
  /// In en, this message translates to:
  /// **'Hex color code'**
  String get hexHintTextLabel;

  /// Used in in about dialog.
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get and;

  /// Label text in the drop-down menu, in the settings dialog.
  ///
  /// In en, this message translates to:
  /// **'Select AI colors provider:'**
  String get selectAiProvider;

  /// Helper text below drop-down menu, for Colormind API, in the settings dialog.
  ///
  /// In en, this message translates to:
  /// **'Older, heavily used, has network issues'**
  String get colormindApiDescription;

  /// Helper text below drop-down menu, for Huemint API, in the settings dialog.
  ///
  /// In en, this message translates to:
  /// **'Brand new, less known so less popular'**
  String get huemintApiDescription;

  /// Huemint's top slider title, in the settings dialog.
  ///
  /// In en, this message translates to:
  /// **'Adjacency (contrast between colors)'**
  String get adjacency;

  /// Huemint's bottom slider title, in the settings dialog.
  ///
  /// In en, this message translates to:
  /// **'Creativity (sampling temperature)'**
  String get temperature;

  /// Vibrations switch tile title, in the settings dialog.
  ///
  /// In en, this message translates to:
  /// **'Vibrations'**
  String get vibrationsTitle;

  /// Vibrations switch tile label, in the settings dialog.
  ///
  /// In en, this message translates to:
  /// **'Enable or disable haptic feedback'**
  String get vibrationsLabel;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['cs', 'en', 'ru', 'sk'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'cs': return AppLocalizationsCs();
    case 'en': return AppLocalizationsEn();
    case 'ru': return AppLocalizationsRu();
    case 'sk': return AppLocalizationsSk();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
