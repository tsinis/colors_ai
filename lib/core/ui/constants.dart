import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show LogicalKeyboardKey;

import '../../color_generator/ui/widgets/buttons/unlock_all_button.dart';
import '../../favorites/ui/widgets/buttons/remove_all_favorites_button.dart';
import '../extensions/context_extensions.dart';

const List<Widget> kAppBarActions = <Widget>[SizedBox.shrink(), UnlockAllButton(), RemoveAllFavoritesButton()];
const String kAppName = 'Colors AI';
const String kDefaultLanguageCode = 'en';
const String kNameForFileSystem = 'colors_ai';
const LogicalKeyboardKey kSpacebar = LogicalKeyboardKey.space;

List<String> tabNames(AppLocalizations l10n) =>
    <String>[l10n.shareTabLabel, l10n.generateTabLabel, l10n.favoritesTabLabel];
