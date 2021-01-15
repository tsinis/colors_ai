import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/colors_locked/locked_bloc.dart';
import '../../../blocs/colors_locked/locked_event.dart';
import '../../../blocs/colors_locked/locked_state.dart';

class LockColorButton extends StatelessWidget {
  const LockColorButton(this.index, {required this.color, this.buttonSize = const Size(24, 24)});
  final int index;
  final Color color;
  final Size buttonSize;
  @override
  Widget build(BuildContext context) => BlocBuilder<LockedBloc, LockedState>(builder: (context, colorState) {
        if (colorState is LockState) {
          final bool isLocked = colorState.isLocked(index);
          return IconButton(
              constraints: BoxConstraints(minWidth: buttonSize.width, minHeight: buttonSize.height),
              color: color.withOpacity(isLocked ? 0.7 : 0.5),
              onPressed: () => BlocProvider.of<LockedBloc>(context).add(ChangeLockEvent(index)),
              icon: Icon(isLocked ? Icons.lock : Icons.lock_open_outlined));
        } else {
          return Container(color: Colors.red); //TODO Edit this.
        }
      });
}
