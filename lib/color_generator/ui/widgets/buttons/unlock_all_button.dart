import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../sound/blocs/sound_bloc.dart';
import '../../../blocs/colors_locked/lock_bloc.dart';

class UnlockAllButton extends StatelessWidget {
  final Icon icon;

  const UnlockAllButton({this.icon = const Icon(Icons.lock_open_outlined), super.key});

  void _onPressed(BuildContext context) {
    BlocProvider.of<SoundBloc>(context).add(const SoundEvent.locked());
    BlocProvider.of<LockBloc>(context).add(const LockAllUnlocked());
  }

  @override
  Widget build(BuildContext context) => IconButton(
        tooltip: context.l10n.unlockAllColors,
        icon: icon,
        onPressed: () => _onPressed(context),
      );
}
