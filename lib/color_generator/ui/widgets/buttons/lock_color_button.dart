import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../sound/blocs/sounds_vibration/sound_bloc.dart';
import '../../../blocs/colors_locked/lock_bloc.dart';

class LockColorButton extends StatelessWidget {
  final Size buttonSize;
  final Color color;
  final int index;

  const LockColorButton(
    this.index, {
    required this.color,
    this.buttonSize = const Size(24, 24),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<LockBloc, LockState>(
        builder: (_, LockState state) {
          if (state is LockSuccess) {
            final bool isLocked = state.isLocked(index);

            return IconButton(
              constraints: BoxConstraints(minWidth: buttonSize.width, minHeight: buttonSize.height),
              color: color.withOpacity(isLocked ? 0.87 : 0.6),
              onPressed: () {
                BlocProvider.of<SoundBloc>(context).add(const SoundLocked());
                BlocProvider.of<LockBloc>(context).add(LockChanged(index));
              },
              icon: Icon(isLocked ? Icons.lock : Icons.lock_open_outlined),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      );
}
