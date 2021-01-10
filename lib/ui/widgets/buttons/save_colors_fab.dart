import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/colors_generated/colors_bloc.dart';
import '../../../blocs/colors_generated/colors_event.dart';

import '../../../blocs/colors_generated/colors_state.dart';

class SaveColorsFAB extends StatelessWidget {
  const SaveColorsFAB({required this.controller});
  final AnimationController controller;
  @override
  Widget build(BuildContext context) => BlocBuilder<ColorsBloc, ColorsState>(builder: (context, state) {
        //TODO! Create and move to UI Bloc,
        if (state is ColorsReorderStartEvent) {
          controller.reverse();
        } else if (state is ColorsReorderEndEvent) {
          controller.forward();
        }
        return FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.playlist_add),
        );
      });
}
