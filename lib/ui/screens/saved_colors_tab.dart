import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/colors_saved/saved_bloc.dart';
import '../../blocs/colors_saved/saved_state.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<SavedBloc, SavedState>(builder: (context, state) => Container(color: Colors.green));
  //TODO! Add saved colors list.
}
