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
          if (state is RemoveFavoritesOpenDialogInitial) {
            SchedulerBinding.instance?.addPostFrameCallback((_) async => showDialog<bool>(
                  context: dialogContext,
                  // https://material.io/components/dialogs#alert-dialog
                  builder: (_) => AlertDialog(
                    content: Text('${AppLocalizations.of(context).removeAllTitle}?'),
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
                ).then((toRemoveAll) {
                  if (toRemoveAll == true) {
                    BlocProvider.of<FavoritesBloc>(context).add(const FavoritesAllRemoved());
                  }
                }));
            BlocProvider.of<RemoveFavoritesBloc>(dialogContext).add(const RemoveFavoritesHided());
          }

          return BlocBuilder<FavoritesBloc, FavoritesState>(
              //TODO Change to RemoveFavoritesBloc.
              builder: (_, state) => IconButton(
                  tooltip: AppLocalizations.of(context).removeAllTitle,
                  icon: const Icon(Mdi.bookmarkRemoveOutline, size: 25),
                  onPressed: (state is FavoritesLoadSuccess)
                      ? () => BlocProvider.of<RemoveFavoritesBloc>(dialogContext).add(const RemoveFavoritesShowed())
                      : null));
        },
      );
}
