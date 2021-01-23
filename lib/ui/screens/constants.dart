import 'package:flutter/material.dart';

import '../widgets/buttons/app_bar_buttons/remove_all_saved_button.dart';
import '../widgets/buttons/app_bar_buttons/unlock_all_button.dart';
import 'navigation_tabs/gen_colors_tab.dart';
import 'navigation_tabs/saved_colors_tab.dart';
import 'navigation_tabs/share_colors_tab.dart';

const List<String> tabLabels = ['Share Colors', 'Generate Colors', 'Saved Colors'];
const List<Widget> navTabs = <Widget>[ShareColors(), ColorsGenerator(), SavedColorsList()];

const List<Widget> appBarActions = <Widget>[SizedBox.shrink(), UnlockAllButton(), RemoveAllSavedButton()];
