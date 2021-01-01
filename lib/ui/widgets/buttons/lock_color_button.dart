import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/color_locked/locked_bloc.dart';
import '../../../blocs/color_locked/locked_event.dart';
import '../../../blocs/color_locked/locked_state.dart';

class LockColorButton extends StatelessWidget {
  const LockColorButton(this.index);
  final int index;

  @override
  Widget build(BuildContext context) => BlocBuilder<LockedBloc, LockedState>(
      builder: (context, colorState) => IconButton(
          onPressed: () => BlocProvider.of<LockedBloc>(context).add(ChangeLockEvent(index)),
          icon: Icon(colorState.isLocked(index) ? Icons.lock_outlined : Icons.lock_open_outlined)));
}
