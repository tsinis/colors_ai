import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/colors_generated/colors_bloc.dart';
import '../../blocs/colors_generated/colors_event.dart';
import '../../blocs/colors_generated/colors_state.dart';
import '../widgets/colors_list.dart';

class ColorsGenerator extends StatelessWidget {
  const ColorsGenerator({required this.appBarHeight});
  final double appBarHeight;

  @override
  Widget build(BuildContext context) => BlocBuilder<ColorsBloc, ColorsState>(builder: (context, state) {
        if (state is ColorsEmptyState || state is ColorsErrorState) {
          return Center(
              child: MaterialButton(
                  color: Colors.white, //TODO Provide button color in theme.
                  onPressed: () => BlocProvider.of<ColorsBloc>(context).add(ColorsInitalGenEvent()),
                  child: const Text('GET COLORS')));
        } else if (state is ColorsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ColorsLoadedState) {
          return ColorsList(state.colorsAI.list, appBarHeight: appBarHeight);
        }
        return const Center(child: CircularProgressIndicator(backgroundColor: Colors.red));
      });
}
