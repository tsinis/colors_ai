import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/colors_bloc.dart';
import '../../bloc/colors_event.dart';

class GenButton extends StatelessWidget {
  const GenButton();

  @override
  Widget build(BuildContext context) => FloatingActionButton(
      onPressed: () => BlocProvider.of<ColorsBloc>(context).add(ColorsGenEvent()),
      tooltip: 'Generate',
      child: const Icon(Icons.refresh));
}
