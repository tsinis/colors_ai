import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show LogicalKeyboardKey;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../color_generator/ui/widgets/buttons/unlock_all_button.dart';
import '../../favorites/ui/widgets/buttons/remove_all_favorites_button.dart';

const List<Widget> kAppBarActions = [SizedBox.shrink(), UnlockAllButton(), RemoveAllFavoritesButton()];
const String kAppName = 'Colors AI';
const LogicalKeyboardKey kSpacebar = LogicalKeyboardKey.space;

List<String> tabNames(AppLocalizations l10n) => [l10n.shareTabLabel, l10n.generateTabLabel, l10n.favoritesTabLabel];
