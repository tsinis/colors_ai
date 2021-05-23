import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mdi/mdi.dart';

import '../../../../blocs/favorite_colors/favorites_bloc.dart';
import '../../../../blocs/favorite_colors/favorites_event.dart';
import '../../../../blocs/favorite_colors/favorites_state.dart';
import '../../../../blocs/remove_favorites/alert_dialog_bloc.dart';
import '../../../../blocs/remove_favorites/alert_dialog_event.dart';
import '../../../../blocs/remove_favorites/alert_dialog_state.dart';

class RemoveAllFavoritesButton extends StatelessWidget {
  const RemoveAllFavoritesButton();

  @override
  Widget build(BuildContext context) => BlocProvider<AlertDialogBloc>(
        create: (_) => AlertDialogBloc(),
        child: BlocBuilder<AlertDialogBloc, AlertDialogState>(
          builder: (BuildContext dialogContext, AlertDialogState state) {
            if (state is AlertDialogOpenInitial) {
              SchedulerBinding.instance?.addPostFrameCallback((_) async => showDialog<bool>(
                    context: dialogContext,
                    // https://material.io/components/dialogs#alert-dialog
                    builder: (_) => AlertDialog(
                      content: const Text('Remove all favorite colors?'),
                      actions: <TextButton>[
                        TextButton(onPressed: () => Navigator.pop(dialogContext, false), child: const Text('CANCEL')),
                        TextButton(
                            onPressed: () => Navigator.pop(dialogContext, true),
                            child: Text('REMOVE', style: TextStyle(color: Theme.of(context).errorColor)))
                      ],
                    ),
                  ).then((toRemoveAll) {
                    if (toRemoveAll == true) {
                      BlocProvider.of<FavoritesBloc>(context).add(const FavoritesAllRemoved());
                    }
                  }));
              BlocProvider.of<AlertDialogBloc>(dialogContext).add(const AlertDialogHided());
            }

            return BlocBuilder<FavoritesBloc, FavoritesState>(
                builder: (_, state) => IconButton(
                    tooltip: 'Remove all favorite colors',
                    icon: const Icon(Mdi.bookmarkRemoveOutline, size: 25),
                    onPressed: (state is FavoritesLoadSuccess)
                        ? () => BlocProvider.of<AlertDialogBloc>(dialogContext).add(const AlertDialogShowed())
                        : null));
          },
        ),
      );
}
