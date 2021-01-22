import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mdi/mdi.dart';
import 'package:vibration/vibration.dart';

import '../../../blocs/colors_saved/saved_bloc.dart';
import '../../../blocs/colors_saved/saved_event.dart';
import '../../../blocs/floating_action_button/fab_bloc.dart';
import '../../../blocs/floating_action_button/fab_state.dart';
import '../../../repositories/colors_repository.dart';

class SaveColorsFAB extends StatefulWidget {
  const SaveColorsFAB();

  @override
  _SaveColorsFABState createState() => _SaveColorsFABState();
}

class _SaveColorsFABState extends State<SaveColorsFAB> with SingleTickerProviderStateMixin {
  late Animation<double> fabAnimation;
  late final AnimationController controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 300))..forward();
    fabAnimation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) => ScaleTransition(
        scale: fabAnimation,
        child: BlocBuilder<FabBloc, FabState>(
          builder: (BuildContext dialogContext, FabState state) {
            // https://material.io/design/environment/elevation.html#elevation-in-material-design
            if (state is FabHideInitial) {
              controller.reverse();
            } else if (state is FabShowInitial) {
              controller.forward();
            }
            return FloatingActionButton(
              onPressed: () async {
                if (await Vibration.hasCustomVibrationsSupport() == true) {
                  // ignore: unawaited_futures
                  Vibration.vibrate(duration: 100);
                }
                BlocProvider.of<SavedBloc>(context)
                    .add(SaveAdded(colorsToSave: context.read<ColorsRepository>().listAsColors));
                // ignore: unawaited_futures
                controller.reverse();
              },
              child: const Icon(Mdi.bookmarkPlusOutline),
            );
          },
        ),
      );
}
