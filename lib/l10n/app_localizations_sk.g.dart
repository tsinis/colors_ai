import 'package:intl/intl.dart' as intl;

import 'app_localizations.g.dart';

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get aboutGenerator => 'Generátor farebných schém, ktorý využíva hlbokého učenie od';

  @override
  String get aboutSourceCode => 'Zdrojový kód tejto aplikácie je dostupný v';

  @override
  String get aboutSourceRepository => 'tomto repozitári GitHub';

  @override
  String get aboutAttribution => 'Uvádzanie pôvodu';

  @override
  String get aboutSounds => 'Zvuky UI použité v tejto aplikácii:';

  @override
  String get aboutByGoogle => 'od';

  @override
  String get aboutSoundsLicense => 'sú licencovaní ako';

  @override
  String get aboutThisAppTooltip => 'O tejto aplikácii';

  @override
  String get noConnectionTitle => 'Ale nie!';

  @override
  String get noConnectionDescription => 'Nedá sa pripojiť k serveru AI.';

  @override
  String get returnButtonLabel => 'Vrátiť sa';

  @override
  String get noFavoritesTitle => 'Och!';

  @override
  String get noFavoritesDescription => 'Zoznam obľúbených paliet je teraz prázdny.';

  @override
  String get addFavoritesButtonLabel => 'Pridajte';

  @override
  String get removeAllTitle => 'Odstrániť všetky obľúbené palety';

  @override
  String get removeButtonLabel => 'Odstrániť';

  @override
  String get urlCopiedMessage => 'Odkaz skopírovaný!';

  @override
  String get urlOpenButtonLabel => 'Otvoriť';

  @override
  String colorCopiedMessage(Object colorHexValue) {
    return 'Farba $colorHexValue skopírovaná!';
  }

  @override
  String get serverMaintenanceMessage => 'Server je aktualizovaný o polnoci PDT, takže môže byť chvíľku nedostupný';

  @override
  String get shareFailedMessage => 'Zdieľanie zlyhalo, skúste iný typ.';

  @override
  String get removeFavoritesTip => 'Kliknutím farby obnovíte.\nPřejetím farby odstránite';

  @override
  String get pullToRefreshTip => 'Ťaháte dole pre generovanie';

  @override
  String get onboardingLockTip => 'Dvojitým kliknutím kdekoľvek zamknete farbu';

  @override
  String get onboardingSelectTip => 'Kliknite na ľavú časť pre výber farby';

  @override
  String get onboardingMoveTip => 'Pozície farieb sú dôležité\npodržte a ťahajte pre preusporiadanie';

  @override
  String get onboardingGenerateTip => 'Ťaháte dole pre generovanie nových farieb';

  @override
  String get onboardingSaveTip => 'Kliknutím na tlačidlo nižšie uložte farby';

  @override
  String get onboardingDoneButtonLabel => 'Chápem';

  @override
  String get shareTabLabel => 'Zdieľať paletu';

  @override
  String get generateTabLabel => 'Generovať paletu';

  @override
  String get noFavoritesTabLabel => 'Žiadne obľúbené palety';

  @override
  String get favoritesTabLabel => 'Obľúbené palety';

  @override
  String get shareLinksLabel => 'Zdieľať odkaz cez:';

  @override
  String get googleArtsExport => 'Umenie, ktoré ladia s vašimi farbami';

  @override
  String get exportTo => 'Export do:';

  @override
  String get copyUrlButtonLabel => 'Kopírovať URL';

  @override
  String get shareUrlButtonLabel => 'Zdieľať URL';

  @override
  String get a4DimensionsTitle => '210 x 297 milimetrov';

  @override
  String get a4DimensionsSubtitle => 'Medzinárodná norma ISO 216';

  @override
  String get letterLabel => 'Letter';

  @override
  String get letterDimensionsTitle => '8,5 x 11 palcov';

  @override
  String get letterDimensionsSubtitle => 'Severoamerický štandard ANSI';

  @override
  String get sharePngButtonLabel => 'Zdieľať PNG';

  @override
  String get sharePdfButtonLabel => 'Zdieľať PDF';

  @override
  String get unlockAllColors => 'Odomknúť všetky farby';

  @override
  String get savePaletteToFavorites => 'Uložiť paletu do obľúbených';

  @override
  String favoritePaletteSematic(Object paletteIndex) {
    return 'Číslo obľúbené palety: $paletteIndex';
  }

  @override
  String removeSomeTitle(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'Odobrať paletu',
      few: 'Odobrať $count palety',
      other: 'Odobrať $count palet',
    );
  }

  @override
  String get addToFavorites => 'Pridať k obľúbeným';

  @override
  String get removeFavoritesTipLandscape => 'Stlačením palety obnovíte farby.\nStisknutím textového štítku skopírujete hodnotu HEX';

  @override
  String get removeFavoritesTooltip => 'Odstrániť túto paletu';

  @override
  String get selectToRemoveFavoritesTooltip => 'Vyberte túto paletu na odstránenie';

  @override
  String get onboardingGenerateTipLandscape => 'Stlačením medzerníka na klávesnici vytvoríte nové farby';

  @override
  String get onboardingSelectTipLandscape => 'Pre výber farby kliknite kamkoľvek (mimo blokovací zónu)';

  @override
  String get onboardingSaveTipLandscape => 'Pre uloženie farieb stlačte tlačidlo v ľavom hornom rohu obrazovky';

  @override
  String get shareFile => 'Zdieľať súbor ako:';

  @override
  String copyAsFormat(Object fileFormat) {
    return 'Kopírovať $fileFormat';
  }

  @override
  String shareAsFormat(Object fileFormat) {
    return 'Zdieľať $fileFormat';
  }

  @override
  String get settings => 'Nastavenia';

  @override
  String get help => 'Pomoc';

  @override
  String get colorsForUiTitle => 'Farby pre UI';

  @override
  String get colorsForUiSubtitle => 'Vylepšite generovanie farieb pre UI design';

  @override
  String get appearance => 'Vzhľad:';

  @override
  String get lightThemeTitle => 'Svetlý';

  @override
  String get lightThemeSubtitle => 'Neutrálne šedá, nekontrastné UI pre svetlé návrhy';

  @override
  String get darkThemeTitle => 'Tmavý';

  @override
  String get darkThemeSubtitle => 'Sýto šedé UI, perfektné pre tmavé návrhy';

  @override
  String get systemThemeTitle => 'Systémové';

  @override
  String get systemThemeSubtitle => 'Použiť jas motívu zariadenia';

  @override
  String get resetButtonLabel => 'Resetovať';

  @override
  String formatCopied(Object fileFormat) {
    return 'Obsah $fileFormat skopírovaný!';
  }

  @override
  String get invalidHexErrorLabel => 'Vložený neplatný HEX kód';

  @override
  String get hexHintTextLabel => 'HEX kód farby';

  @override
  String get and => 'a';

  @override
  String get selectAiProvider => 'Vyberte poskytovateľa farieb AI:';

  @override
  String get colormindApiDescription => 'Starší, má problémy s konektivitou';

  @override
  String get huemintApiDescription => 'Zbrusu nový, menej známy/populárny';

  @override
  String get adjacency => 'Priľahlosť (kontrast medzi farbami)';

  @override
  String get temperature => 'Kreativita (teplota vzorkovania)';
}
