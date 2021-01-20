import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/colors_generated/colors_bloc.dart';
import '../../../blocs/colors_generated/colors_event.dart';
import '../../../blocs/colors_generated/colors_state.dart';
import '../../widgets/colors_list.dart';

class ColorsGenerator extends StatelessWidget {
  const ColorsGenerator();

  @override
  Widget build(BuildContext context) => BlocBuilder<ColorsBloc, ColorsState>(builder: (context, state) {
        if (state is ColorsEmptyState || state is ColorsErrorState) {
          return Center(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.refresh_outlined, size: 20),
              label: const Text('GET COLORS'),
              autofocus: true,
              onPressed: () => BlocProvider.of<ColorsBloc>(context).add(const ColorsInitalGenEvent()),
            ),
          );
        } else if (state is ColorsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ColorsLoadedState) {
          return ColorsList(state.colorsAI.list);
        }
        return const Center(child: CircularProgressIndicator(backgroundColor: Colors.red));
      });
}
