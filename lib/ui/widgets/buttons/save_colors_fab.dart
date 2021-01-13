import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibration/vibration.dart';

import '../../../blocs/colors_saved/saved_bloc.dart';
import '../../../blocs/colors_saved/saved_event.dart';
import '../../../blocs/fab_bloc/fab_bloc.dart';
import '../../../blocs/fab_bloc/fab_state.dart';
import '../../../repositories/colors_repository.dart';

class SaveColorsFAB extends StatelessWidget {
  const SaveColorsFAB({required this.controller});
  final AnimationController controller;
  @override
  Widget build(BuildContext context) => BlocBuilder<FabBloc, FabState>(
        builder: (BuildContext dialogContext, FabState state) {
          // https://material.io/design/environment/elevation.html#elevation-in-material-design
          if (state is FabReorderStartState) {
            controller.reverse();
          } else if (state is FabReorderEndState) {
            controller.forward();
          }
          return FloatingActionButton(
            onPressed: () async {
              final bool hasVibrator = await Vibration.hasVibrator() ?? false;
              final bool hasExtendedVibrator = await Vibration.hasCustomVibrationsSupport() ?? false;
              if (hasExtendedVibrator) {
                await Vibration.vibrate(duration: 140);
              } else if (hasVibrator) {
                // ignore: unawaited_futures
                Vibration.vibrate();
              }
              BlocProvider.of<SavedBloc>(context)
                  .add(SavedAddEvent(colorsToSave: context.read<ColorsRepository>().listAsColors));
              // ignore: unawaited_futures
              controller.reverse();
            },
            child: const Icon(Icons.playlist_add),
          );
        },
      );
}
