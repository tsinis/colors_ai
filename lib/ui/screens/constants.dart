import 'package:flutter/material.dart';

import '../widgets/buttons/app_bar_buttons/remove_all_favorites_button.dart';
import '../widgets/buttons/app_bar_buttons/unlock_all_button.dart';
import 'navigation_tabs/favorites_tab.dart';
import 'navigation_tabs/gen_colors_tab.dart';
import 'navigation_tabs/share_colors_tab.dart';

const List<Widget> navTabs = <Widget>[ShareColors(), ColorsGenerator(), FavoritesTab()];

const List<Widget> appBarActions = <Widget>[SizedBox.shrink(), UnlockAllButton(), RemoveAllFavoritesButton()];
