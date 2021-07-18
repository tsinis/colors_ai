import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../favorites/blocs/remove_favorites/remove_favs_bloc.dart';
import '../../../navigation/blocs/navigation/navigation_bloc.dart';
import '../constants.dart';

class AppBarInfoTitle extends StatelessWidget {
  const AppBarInfoTitle({required this.selectedTabIndex});

  final int selectedTabIndex;

  @override
  Widget build(BuildContext context) => BlocBuilder<RemoveFavoritesBloc, RemoveFavoritesState>(
        builder: (_, favState) {
          final List<String> tabLabels = tabNames(AppLocalizations.of(context));
          late String? appBarInfo;
          if (selectedTabIndex == const NavigationFavoritesTabInitial().tabIndex && favState.selections.isNotEmpty) {
            appBarInfo = AppLocalizations.of(context).removeSomeTitle(favState.selections.length);
          } else {
            appBarInfo = null;
          }
          return Text(
            appBarInfo ?? tabLabels.elementAt(selectedTabIndex),
            style: const TextStyle(fontWeight: FontWeight.w400),
          );
        },
      );
}
