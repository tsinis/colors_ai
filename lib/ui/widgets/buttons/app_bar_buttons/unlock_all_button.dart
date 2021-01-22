import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/colors_locked/locked_bloc.dart';
import '../../../../blocs/colors_locked/locked_event.dart';

class UnlockAllButton extends StatelessWidget {
  const UnlockAllButton();
  @override
  Widget build(BuildContext context) => IconButton(
        icon: const Icon(Icons.lock_open_sharp),
        onPressed: () => BlocProvider.of<LockedBloc>(context).add(LockUnlocked()),
      );
}
