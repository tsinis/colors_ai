import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/colors_saved/saved_bloc.dart';
import '../../blocs/colors_saved/saved_state.dart';
import '../widgets/saved_list.dart';

class SavedColorsList extends StatelessWidget {
  const SavedColorsList(this.moveBack); //TODO Add to TabBloc.
  final Function() moveBack;
  @override
  Widget build(BuildContext context) => BlocBuilder<SavedBloc, SavedState>(
        builder: (BuildContext context, state) {
          if (state is SavedEmptyState) {
            return const Center(child: FlutterLogo());
          } else if (state is SavedLoadedState) {
            return SavedList(moveBack: moveBack, savedColors: state.savedColors.list);
          }
          return Container(color: Colors.red);
        },
      );
}
