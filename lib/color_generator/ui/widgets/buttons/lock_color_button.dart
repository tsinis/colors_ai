import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../sound/blocs/sound_bloc.dart';
import '../../../blocs/colors_locked/lock_bloc.dart';

class LockColorButton extends StatelessWidget {
  final Size buttonSize;
  final Color color;
  final int index;
  final LockBloc bloc;

  const LockColorButton(
    this.index, {
    required this.bloc,
    required this.color,
    this.buttonSize = const Size(24, 24),
    super.key,
  });

  void _onPressed(BuildContext context) {
    BlocProvider.of<SoundBloc>(context).add(const SoundEvent.locked());
    bloc.add(LockChanged(index));
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<LockBloc, LockState>(
        bloc: bloc,
        builder: (_, LockState state) {
          if (state is LockSuccess) {
            final bool isLocked = state.isLocked(index);

            return IconButton(
              constraints: BoxConstraints(minWidth: buttonSize.width, minHeight: buttonSize.height),
              color: color.withOpacity(isLocked ? 0.87 : 0.6),
              onPressed: () => _onPressed(context),
              icon: Icon(isLocked ? Icons.lock : Icons.lock_open_outlined),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      );
}
