import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show SchedulerBinding;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../about/blocs/about_dialog/about_bloc.dart';
import '../../../about/ui/view/about_dialog.dart';
import '../../../settings/ui/view/settings_dialog.dart';

class OverflowMenu extends StatelessWidget {
  const OverflowMenu();

  void showDialog(BuildContext context, Widget dialog) {
    SchedulerBinding.instance?.addPostFrameCallback((_) async => showModal<void>(
          context: context,
          configuration: const FadeScaleTransitionConfiguration(
            transitionDuration: Duration(milliseconds: 400),
            reverseTransitionDuration: Duration(milliseconds: 200),
          ),
          useRootNavigator: true,
          builder: (_) => dialog,
        ));
  }

  @override
  Widget build(BuildContext context) => PopupMenuButton<void>(
        itemBuilder: (_) => [
          PopupMenuItem(onTap: () => showDialog(context, const SettingsDialog()), child: const Text('Settings')),
          PopupMenuItem(
              onTap: () =>
                  showDialog(context, AboutAppDialog(version: BlocProvider.of<AboutBloc>(context).state.appVersion)),
              child: const Text('About')),
        ],
      );
}
