import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../general/repository/colors_repository.dart';
import '../../../../sound/blocs/sounds_vibration/sound_bloc.dart';
import '../../../blocs/add_favorites/fab_bloc.dart';
import '../../../blocs/list_favorites/favorites_bloc.dart';

class SaveColorsFAB extends StatefulWidget {
  const SaveColorsFAB();

  @override
  _SaveColorsFABState createState() => _SaveColorsFABState();
}

class _SaveColorsFABState extends State<SaveColorsFAB> with SingleTickerProviderStateMixin {
  late final Animation<double> fabAnimation;
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
          builder: (_, state) {
            // https://material.io/design/environment/elevation.html#elevation-in-material-design
            if (state is FabHideInitial) {
              controller.reverse();
            } else if (state is FabShowInitial) {
              controller.forward();
            }
            return FloatingActionButton(
              onPressed: () {
                BlocProvider.of<SoundBloc>(context).add(const SoundFavoritesAdded());
                BlocProvider.of<FavoritesBloc>(context)
                    .add(FavoritesAdded(favorite: context.read<ColorsRepository>().toPalette()));
                controller.reverse();
              },
              child: const Icon(Icons.bookmark_add_outlined),
            );
          },
        ),
      );
}
