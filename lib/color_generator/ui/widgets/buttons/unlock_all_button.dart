import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../sound/blocs/sound_bloc.dart';
import '../../../blocs/colors_locked/lock_bloc.dart';

class UnlockAllButton extends StatelessWidget {
  final Icon icon;

  const UnlockAllButton({this.icon = const Icon(Icons.lock_open_outlined), Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => IconButton(
        tooltip: context.l10n.unlockAllColors,
        icon: icon,
        onPressed: () {
          BlocProvider.of<SoundBloc>(context).add(const SoundLocked());
          BlocProvider.of<LockBloc>(context).add(const LockAllUnlocked());
        },
      );
}
