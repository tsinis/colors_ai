import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/colors_bloc.dart';
import '../bloc/colors_state.dart';
import '../extensions/colors_rgb.dart';

class ColorsAIList extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocBuilder<ColorsBloc, ColorsState>(builder: (context, state) {
        if (state is ColorsEmptyState || state is ColorsErrorState) {
          return const Center(child: Text('No Data from API'));
        } else if (state is ColorsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ColorsLoadedState) {
          return Row(
              children: List.generate(state.colorsAI.result.length,
                  (i) => Flexible(child: Container(color: state.colorsAI.result[i].toColor())),
                  growable: false));
        }
        return const Center(child: CircularProgressIndicator(backgroundColor: Colors.red));
      });
}
