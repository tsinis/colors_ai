import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/colors_locked/locked_bloc.dart';
import '../../../../blocs/colors_locked/locked_event.dart';
import '../../../../blocs/sounds_audio/sound_bloc.dart';

class UnlockAllButton extends StatelessWidget {
  const UnlockAllButton();
  @override
  Widget build(BuildContext context) => IconButton(
        tooltip: 'Unlock all colors',
        icon: const Icon(Icons.lock_open_sharp),
        onPressed: () {
          BlocProvider.of<SoundBloc>(context).add(const SoundLocked());
          BlocProvider.of<LockedBloc>(context).add(const LockAllUnlocked());
        },
      );
}
