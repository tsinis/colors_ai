import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mdi/mdi.dart';

import '../../../../blocs/colors_saved/saved_bloc.dart';
import '../../../../blocs/colors_saved/saved_event.dart';
import '../../../../blocs/colors_saved/saved_state.dart';
import '../../../../blocs/remove_all_saved/alert_dialog_bloc.dart';
import '../../../../blocs/remove_all_saved/alert_dialog_event.dart';
import '../../../../blocs/remove_all_saved/alert_dialog_state.dart';

class RemoveAllSavedButton extends StatelessWidget {
  const RemoveAllSavedButton();
  @override
  Widget build(BuildContext context) => BlocProvider<AlertDialogBloc>(
        create: (_) => AlertDialogBloc(),
        child: BlocBuilder<AlertDialogBloc, AlertDialogState>(
          builder: (BuildContext dialogContext, AlertDialogState state) {
            if (state is AlertDialogShowingState) {
              SchedulerBinding.instance?.addPostFrameCallback((_) async {
                await showDialog<bool>(
                  context: dialogContext,
                  // https://material.io/components/dialogs#alert-dialog
                  builder: (_) => AlertDialog(
                    content: const Text('Remove all saved colors?'),
                    actions: <TextButton>[
                      TextButton(
                          onPressed: () => Navigator.pop(dialogContext, false),
                          child: const Text('CANCEL', style: TextStyle(color: Colors.black))),
                      TextButton(
                          onPressed: () => Navigator.pop(dialogContext, true),
                          child: const Text('REMOVE', style: TextStyle(color: Colors.red)))
                    ],
                  ),
                ).then((toRemoveAll) => (toRemoveAll == true)
                    ? BlocProvider.of<SavedBloc>(context).add(const SavedRemoveAllEvent())
                    : null);
              });
              BlocProvider.of<AlertDialogBloc>(dialogContext).add(const HideAlertDialog());
            }
            return BlocBuilder<SavedBloc, SavedState>(
                builder: (_, state) => IconButton(
                    icon: const Icon(Mdi.bookmarkRemoveOutline, size: 25),
                    onPressed: (state is SavedLoadedState)
                        ? () => BlocProvider.of<AlertDialogBloc>(dialogContext).add(const ShowAlertDialog())
                        : null));
          },
        ),
      );
}
