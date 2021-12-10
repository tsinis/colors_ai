import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/ui/constants.dart';
import '../../../favorites/blocs/remove_favorites/remove_favorites_bloc.dart';
import '../../../navigation/blocs/navigation/navigation_bloc.dart';

class AppBarInfoTitle extends StatelessWidget {
  final int selectedTabIndex;

  const AppBarInfoTitle({
    required this.selectedTabIndex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<RemoveFavoritesBloc, RemoveFavoritesState>(
        builder: (_, RemoveFavoritesState favState) {
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
