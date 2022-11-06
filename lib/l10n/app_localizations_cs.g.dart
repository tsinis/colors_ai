import 'package:intl/intl.dart' as intl;

import 'app_localizations.g.dart';

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get aboutGenerator => 'Generátor barevných schémat, který využívá hlubokého učení od';

  @override
  String get aboutSourceCode => 'Zdrojový kód této aplikace je dostupný v';

  @override
  String get aboutSourceRepository => 'tomto repozitáři GitHub';

  @override
  String get aboutAttribution => 'Uvádění původu';

  @override
  String get aboutSounds => 'Zvuky UI použité v této aplikaci:';

  @override
  String get aboutByGoogle => 'od';

  @override
  String get aboutSoundsLicense => 'jsou licencováni jako';

  @override
  String get aboutThisAppTooltip => 'O této aplikaci';

  @override
  String get noConnectionTitle => 'Ale ne!';

  @override
  String get noConnectionDescription => 'Nelze se připojit k serveru AI.';

  @override
  String get returnButtonLabel => 'Vrátit se';

  @override
  String get noFavoritesTitle => 'Jejda!';

  @override
  String get noFavoritesDescription => 'Seznam oblíbených palet je nyní prázdný.';

  @override
  String get addFavoritesButtonLabel => 'Přidejte';

  @override
  String get removeAllTitle => 'Odstranit všechny oblíbené palety';

  @override
  String get removeButtonLabel => 'Odstranit';

  @override
  String get urlCopiedMessage => 'Odkaz zkopírován!';

  @override
  String get urlOpenButtonLabel => 'Otevřít';

  @override
  String colorCopiedMessage(Object colorHexValue) {
    return 'Barva $colorHexValue zkopírována!';
  }

  @override
  String get serverMaintenanceMessage => 'Server je aktualizován o půlnoci PDT, takže může být chvílku nedostupný';

  @override
  String get shareFailedMessage => 'Sdílení se nezdařilo, zkuste jiný typ.';

  @override
  String get removeFavoritesTip => 'Klepnutím barvy obnovíte.\nPřejetím barvy odstraníte';

  @override
  String get pullToRefreshTip => 'Táhnete dolů pro generování';

  @override
  String get onboardingLockTip => 'Dvojitým klepnutím kdekoli zamknete barvu';

  @override
  String get onboardingSelectTip => 'Klepněte na levou část pro výběr barvy';

  @override
  String get onboardingMoveTip => 'Pozice barev jsou důležité\npodržte a táhněte pro přeuspořádání';

  @override
  String get onboardingGenerateTip => 'Táhnete dolů pro generování nových barev';

  @override
  String get onboardingSaveTip => 'Klepnutím na tlačítko níže uložte barvy';

  @override
  String get onboardingDoneButtonLabel => 'Chápu';

  @override
  String get shareTabLabel => 'Sdílet paletu';

  @override
  String get generateTabLabel => 'Generovat paletu';

  @override
  String get noFavoritesTabLabel => 'Žádné oblíbené palety';

  @override
  String get favoritesTabLabel => 'Oblíbené palety';

  @override
  String get shareLinksLabel => 'Sdílet odkaz přes:';

  @override
  String get googleArtsExport => 'Umění, které ladí s vašimi barvami';

  @override
  String get exportTo => 'Export do:';

  @override
  String get copyUrlButtonLabel => 'Kopírovat URL';

  @override
  String get shareUrlButtonLabel => 'Sdílet URL';

  @override
  String get a4DimensionsTitle => '210 x 297 milimetrů';

  @override
  String get a4DimensionsSubtitle => 'Mezinárodní norma ISO 216';

  @override
  String get letterLabel => 'Letter';

  @override
  String get letterDimensionsTitle => '8,5 x 11 palců';

  @override
  String get letterDimensionsSubtitle => 'Severoamerický standard ANSI';

  @override
  String get sharePngButtonLabel => 'Sdílet PNG';

  @override
  String get sharePdfButtonLabel => 'Sdílet PDF';

  @override
  String get unlockAllColors => 'Odemknout všechny barvy';

  @override
  String get savePaletteToFavorites => 'Uložit paletu do oblíbených';

  @override
  String favoritePaletteSematic(Object paletteIndex) {
    return 'Číslo oblíbené palety: $paletteIndex';
  }

  @override
  String removeSomeTitle(num count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: 'Odebrat paletu',
      few: 'Odebrat $count palety',
      other: 'Odebrat $count palet',
    );
  }

  @override
  String get addToFavorites => 'Přidat k oblíbeným';

  @override
  String get removeFavoritesTipLandscape => 'Stisknutím palety obnovíte barvy.\nStisknutím textového štítku zkopírujete hodnotu HEX';

  @override
  String get removeFavoritesTooltip => 'Odstranit tuto paletu';

  @override
  String get selectToRemoveFavoritesTooltip => 'Vyberte tuto paletu k odstranění';

  @override
  String get onboardingGenerateTipLandscape => 'Stisknutím mezerníku na klávesnici vytvoříte nové barvy';

  @override
  String get onboardingSelectTipLandscape => 'Pro výběr barvy klikněte kamkoli (mimo zamykací zónu)';

  @override
  String get onboardingSaveTipLandscape => 'Pro uložení barev stiskněte tlačítko v levém horním rohu obrazovky';

  @override
  String get shareFile => 'Sdílet soubor jako:';

  @override
  String copyAsFormat(Object fileFormat) {
    return 'Kopírovat $fileFormat';
  }

  @override
  String shareAsFormat(Object fileFormat) {
    return 'Sdílet $fileFormat';
  }

  @override
  String get settings => 'Nastavení';

  @override
  String get help => 'Pomoc';

  @override
  String get colorsForUiTitle => 'Barvy pro UI';

  @override
  String get colorsForUiSubtitle => 'Vylepšete generování barev pro UI design';

  @override
  String get appearance => 'Vzhled:';

  @override
  String get lightThemeTitle => 'Světlý';

  @override
  String get lightThemeSubtitle => 'Neutrální šedá, nekontrastní UI pro světlé návrhy';

  @override
  String get darkThemeTitle => 'Tmavý';

  @override
  String get darkThemeSubtitle => 'Sytě šedé UI, perfektní pro tmavé návrhy';

  @override
  String get systemThemeTitle => 'Systémové';

  @override
  String get systemThemeSubtitle => 'Použít jas motivu zařízení';

  @override
  String get resetButtonLabel => 'Resetovat';

  @override
  String formatCopied(Object fileFormat) {
    return 'Obsah $fileFormat zkopírován!';
  }

  @override
  String get invalidHexErrorLabel => 'Vložen neplatný HEX kód';

  @override
  String get hexHintTextLabel => 'HEX kód barvy';

  @override
  String get and => 'a';

  @override
  String get selectAiProvider => 'Vyberte poskytovatele barev AI:';

  @override
  String get colormindApiDescription => 'Starší, má problémy s konektivitou';

  @override
  String get huemintApiDescription => 'Zbrusu nový, méně známý/populární';

  @override
  String get adjacency => 'Přilehlost (kontrast mezi barvami)';

  @override
  String get temperature => 'Kreativita (teplota vzorkování)';

  @override
  String get vibrationsTitle => 'Vibrace';

  @override
  String get vibrationsLabel => 'Povolení nebo zakázání haptické odezvy';
}
