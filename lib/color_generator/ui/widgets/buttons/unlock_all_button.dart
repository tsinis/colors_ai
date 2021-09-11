import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../sound/blocs/sounds_vibration/sound_bloc.dart';
import '../../../blocs/colors_locked/locked_bloc.dart';

class UnlockAllButton extends StatelessWidget {
  const UnlockAllButton();

  @override
  Widget build(BuildContext context) => IconButton(
        tooltip: AppLocalizations.of(context).unlockAllColors,
        icon: const Icon(Icons.lock_open_outlined),
        onPressed: () {
          BlocProvider.of<SoundBloc>(context).add(
            const SoundLocked(),
          );
          BlocProvider.of<LockedBloc>(context).add(
            const LockAllUnlocked(),
          );
        },
      );
}
