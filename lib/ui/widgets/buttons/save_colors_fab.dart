import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mdi/mdi.dart';
import 'package:vibration/vibration.dart';

import '../../../blocs/favorite_colors/favorites_bloc.dart';
import '../../../blocs/favorite_colors/favorites_event.dart';
import '../../../blocs/floating_action_button/fab_bloc.dart';
import '../../../blocs/floating_action_button/fab_state.dart';
import '../../../blocs/sounds_audio/sound_bloc.dart';
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
          builder: (BuildContext context, FabState state) {
            // https://material.io/design/environment/elevation.html#elevation-in-material-design
            if (state is FabHideInitial) {
              controller.reverse();
            } else if (state is FabShowInitial) {
              controller.forward();
            }
            return FloatingActionButton(
              onPressed: () async {
                BlocProvider.of<SoundBloc>(context).add(const SoundFavoritesAdded());
                BlocProvider.of<FavoritesBloc>(context)
                    .add(FavoritesAdded(colorsToSave: context.read<ColorsRepository>().listAsColors));
                // ignore: unawaited_futures
                controller.reverse();
                if (await Vibration.hasCustomVibrationsSupport() == true) {
                  // ignore: unawaited_futures
                  Vibration.vibrate(duration: 100);
                }
              },
              child: const Icon(Mdi.bookmarkPlusOutline),
            );
          },
        ),
      );
}