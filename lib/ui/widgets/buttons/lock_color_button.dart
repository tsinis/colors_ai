import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/colors_locked/locked_bloc.dart';
import '../../../blocs/colors_locked/locked_event.dart';
import '../../../blocs/colors_locked/locked_state.dart';
import '../../../blocs/sounds_audio/sound_bloc.dart';

class LockColorButton extends StatelessWidget {
  const LockColorButton(this.index, {required this.color, this.buttonSize = const Size(24, 24)});
  final int index;
  final Color color;
  final Size buttonSize;
  @override
  Widget build(BuildContext context) => BlocBuilder<LockedBloc, LockState>(
        builder: (context, colorState) {
          if (colorState is LockSuccess) {
            final bool isLocked = colorState.isLocked(index);
            return IconButton(
                constraints: BoxConstraints(minWidth: buttonSize.width, minHeight: buttonSize.height),
                color: color.withOpacity(isLocked ? 0.87 : 0.6),
                onPressed: () {
                  BlocProvider.of<SoundBloc>(context).add(const SoundLocked());
                  BlocProvider.of<LockedBloc>(context).add(LockChanged(index));
                },
                icon: Icon(isLocked ? Icons.lock : Icons.lock_open_outlined));
          } else {
            return Container(color: Colors.red); //TODO Edit this.
          }
        },
      );
}
