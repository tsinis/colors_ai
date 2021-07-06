import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mdi/mdi.dart';

import '../../../blocs/list_favorites/favorites_bloc.dart';
import '../../../blocs/remove_favorites/remove_favs_bloc.dart';

class RemoveAllFavoritesButton extends StatelessWidget {
  const RemoveAllFavoritesButton();

  @override
  Widget build(BuildContext context) => BlocBuilder<RemoveFavoritesBloc, RemoveFavoritesState>(
        builder: (BuildContext dialogContext, RemoveFavoritesState state) {
          final bool haveSelection = state.selections.isNotEmpty;
          if (state is RemoveFavoritesOpenDialogInitial) {
            SchedulerBinding.instance?.addPostFrameCallback((_) async => showDialog<bool>(
                  context: dialogContext,
                  // https://material.io/components/dialogs#alert-dialog
                  builder: (_) => AlertDialog(
                    content: Text(haveSelection
                        ? 'Remove ${state.selections.length} palettes?' //TODO Add L10N
                        : '${AppLocalizations.of(context).removeAllTitle}?'),
                    actions: <TextButton>[
                      TextButton(
                        onPressed: () => Navigator.pop(dialogContext, false),
                        child: Text(AppLocalizations.of(context).cancelButtonLabel.toUpperCase()),
                      ),
                      TextButton(
                          onPressed: () => Navigator.pop(dialogContext, true),
                          child: Text(AppLocalizations.of(context).removeButtonLabel.toUpperCase(),
                              style: TextStyle(color: Theme.of(context).errorColor)))
                    ],
                  ),
                ).then(
                  (toRemove) {
                    if (toRemove == true) {
                      BlocProvider.of<FavoritesBloc>(context).add(FavoritesSeveralRemoved(state.selections));
                      BlocProvider.of<RemoveFavoritesBloc>(context).add(const RemoveFavoritesRemoved());
                    }
                  },
                ));
            BlocProvider.of<RemoveFavoritesBloc>(dialogContext).add(const RemoveFavoritesHided());
          }

          return BlocBuilder<FavoritesBloc, FavoritesState>(
              builder: (_, favState) => IconButton(
                  tooltip: AppLocalizations.of(context).removeAllTitle, //TODO Replace L10N.
                  icon: Icon(
                    Mdi.bookmarkRemoveOutline,
                    size: 25,
                    color: haveSelection ? Theme.of(context).errorColor : null,
                  ),
                  onPressed: (favState is FavoritesLoadSuccess)
                      ? () => BlocProvider.of<RemoveFavoritesBloc>(dialogContext).add(const RemoveFavoritesShowed())
                      : null));
        },
      );
}
