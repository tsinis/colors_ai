import 'package:intl/intl.dart' as intl;

import 'app_localizations.g.dart';

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get aboutGenerator => 'Генератор цветовых схем, использующий глубокое обучение';

  @override
  String get aboutSourceCode => 'Исходный код этого приложения доступен';

  @override
  String get aboutSourceRepository => 'в этом репозитории GitHub';

  @override
  String get aboutAttribution => 'Указание авторства';

  @override
  String get aboutSounds => 'Звуки пользовательского интерфейса, используемые в этом приложении:';

  @override
  String get aboutByGoogle => 'от';

  @override
  String get aboutSoundsLicense => 'лицензированы под';

  @override
  String get aboutThisAppTooltip => 'Об этом приложении';

  @override
  String get noConnectionTitle => 'О нет!';

  @override
  String get noConnectionDescription => 'Невозможно подключиться к серверу.';

  @override
  String get returnButtonLabel => 'Вернуться';

  @override
  String get noFavoritesTitle => 'Ой!';

  @override
  String get noFavoritesDescription => 'Список любимых палитр теперь пуст.';

  @override
  String get addFavoritesButtonLabel => 'Добавить';

  @override
  String get removeAllTitle => 'Удалить все любимые палитры';

  @override
  String get removeButtonLabel => 'Удалить';

  @override
  String get urlCopiedMessage => 'Ссылка скопирована!';

  @override
  String get urlOpenButtonLabel => 'Открыть';

  @override
  String colorCopiedMessage(Object colorHexValue) {

    return 'Цвет $colorHexValue скопирован!';
  }

  @override
  String get serverMaintenanceMessage => 'Сервер обновляется в полночь PDT, поэтому он может быть недоступен в течение 30 сек.';

  @override
  String get shareFailedMessage => 'Не удалось поделиться, попробуйте другой тип';

  @override
  String get removeFavoritesTip => 'Нажмите на цвета, для восстановления.\nПроведите пальцем чтобы удалить их.';

  @override
  String get pullToRefreshTip => 'Потяните вниз, чтобы обновить';

  @override
  String get onboardingLockTip => 'Дважды нажмите в любом месте, чтобы заблокировать цвет';

  @override
  String get onboardingSelectTip => 'Нажмите на левую часть, чтобы выбрать цвет';

  @override
  String get onboardingMoveTip => 'Положение цветов имеет значение,\nудерживайте и перетаскивайте, чтобы изменить их порядок';

  @override
  String get onboardingGenerateTip => 'Потяните вниз, чтобы создать новые цвета';

  @override
  String get onboardingSaveTip => 'Нажмите кнопку ниже, чтобы сохранить цвета';

  @override
  String get onboardingDoneButtonLabel => 'Ясно';

  @override
  String get shareTabLabel => 'Поделиться палитрой';

  @override
  String get generateTabLabel => 'Создать палитру';

  @override
  String get noFavoritesTabLabel => 'Нет любимых палитр';

  @override
  String get favoritesTabLabel => 'Любимые палитры';

  @override
  String get shareLinksLabel => 'Поделиться ссылкой через:';

  @override
  String get googleArtsExport => 'Искусства, соответствующие вашим цветам';

  @override
  String get exportTo => 'Экспорт в:';

  @override
  String get copyUrlButtonLabel => 'Копировать URL';

  @override
  String get shareUrlButtonLabel => 'Поделиться URL';

  @override
  String get a4DimensionsTitle => '210 на 297 миллиметров';

  @override
  String get a4DimensionsSubtitle => 'Международный стандарт ISO 216';

  @override
  String get letterLabel => 'Letter';

  @override
  String get letterDimensionsTitle => '8,5 на 11 дюймов';

  @override
  String get letterDimensionsSubtitle => 'Североамериканский стандарт ANSI';

  @override
  String get sharePngButtonLabel => 'Поделиться PNG';

  @override
  String get sharePdfButtonLabel => 'Поделиться PDF';

  @override
  String get unlockAllColors => 'Разблокировать все цвета';

  @override
  String get savePaletteToFavorites => 'Сохранить эту палитру в избранном';

  @override
  String favoritePaletteSematic(Object paletteIndex) {

    return 'Номер палитры любимых цветов: $paletteIndex';
  }

  @override
  String removeSomeTitle(num count) {
    String _removeSomeTitle0(num count) {
      return 'Удалить $count палитры';
    }

    String _removeSomeTitle1(num count) {
      return 'Удалить $count палитр';
    }

    String _removeSomeTitle2(num count) {
      return 'Удалить $count палитры';
    }

    String _removeSomeTitle3(num count) {
      return 'Удалить $count палитры';
    }

    String _removeSomeTitle4(num count) {
      return 'Удалить $count палитру';
    }

    String _removeSomeTitle5(num count) {
      return intl.Intl.pluralLogic(
        count,
        locale: localeName,
      other: _removeSomeTitle0(count),
      many: _removeSomeTitle1(count),
      few: _removeSomeTitle2(count),
      two: _removeSomeTitle3(count),
      one: _removeSomeTitle4(count),
      );
    }
    return _removeSomeTitle5(count);
  }

  @override
  String get addToFavorites => 'Добавить в избранное';

  @override
  String get removeFavoritesTipLandscape => 'Нажмите на палитру, чтобы восстановить цвета.\nНажмите на текстовую метку, чтобы скопировать HEX-значение';

  @override
  String get removeFavoritesTooltip => 'Удалить эту палитру';

  @override
  String get selectToRemoveFavoritesTooltip => 'Выберите эту палитру для удаления';

  @override
  String get onboardingGenerateTipLandscape => 'Нажмите пробел на клавиатуре для генерации новых цветов';

  @override
  String get onboardingSelectTipLandscape => 'Нажмите на любую область (вне зоны блокировки), чтобы выбрать цвет';

  @override
  String get onboardingSaveTipLandscape => 'Нажмите кнопку в левом верхнем углу экрана, чтобы сохранить цвета';

  @override
  String get shareFile => 'Поделиться файлом как:';

  @override
  String copyAsFormat(Object fileFormat) {

    return 'Копировать $fileFormat';
  }

  @override
  String shareAsFormat(Object fileFormat) {

    return 'Поделиться $fileFormat';
  }

  @override
  String get settings => 'Настройки';

  @override
  String get help => 'Помощь';

  @override
  String get colorsForUiTitle => 'Цвета для интерфейса';

  @override
  String get colorsForUiSubtitle => 'Улучшение генерации цветов для UI дизайна';

  @override
  String get appearance => 'Внешний вид';

  @override
  String get lightThemeTitle => 'Светлый';

  @override
  String get lightThemeSubtitle => 'Нейтрально-серый, неконтрастный интерфейс';

  @override
  String get darkThemeTitle => 'Тёмный';

  @override
  String get darkThemeSubtitle => 'Насыщенно-серый пользовательский интерфейс';

  @override
  String get systemThemeTitle => 'Системный';

  @override
  String get systemThemeSubtitle => 'Использует яркость темы устройства';

  @override
  String get resetButtonLabel => 'Сброс';

  @override
  String formatCopied(Object fileFormat) {

    return 'Содержимое $fileFormat файла скопировано!';
  }

  @override
  String get invalidHexErrorLabel => 'Вставлен неверный HEX код';

  @override
  String get hexHintTextLabel => 'HEX код цвета';

  @override
  String get and => 'и';

  @override
  String get selectAiProvider => 'Выберите поставщика цветов AI:';

  @override
  String get colormindApiDescription => 'Старый, имеет проблемы с соединением';

  @override
  String get huemintApiDescription => 'Новый, менее известный/популярный';

  @override
  String get adjacency => ' Смежность (контраст между цветами)';

  @override
  String get temperature => 'Креативность (температура выборки)';

  @override
  String get vibrationsTitle => 'Вибрации';

  @override
  String get vibrationsLabel => 'Включение или отключение вибраций';
}
