import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/colors_locked/locked_bloc.dart';
import '../../../blocs/colors_locked/locked_event.dart';
import '../../../blocs/colors_locked/locked_state.dart';

class LockColorButton extends StatelessWidget {
  const LockColorButton(this.index, {required this.color});
  final int index;
  final Color color;
  @override
  Widget build(BuildContext context) => BlocBuilder<LockedBloc, LockedState>(builder: (context, colorState) {
        final bool isLocked = colorState.isLocked(index);
        return IconButton(
            color: color.withOpacity(isLocked ? 0.7 : 0.5),
            onPressed: () => BlocProvider.of<LockedBloc>(context).add(ChangeLockEvent(index)),
            icon: Icon(isLocked ? Icons.lock : Icons.lock_open_outlined));
      });
}
