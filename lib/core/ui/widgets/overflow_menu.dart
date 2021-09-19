import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show SchedulerBinding;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../about/ui/view/about_dialog.dart';
import '../../../settings/ui/view/settings_dialog.dart';

class OverflowMenu extends StatelessWidget {
  const OverflowMenu();

  void showDialog(BuildContext context, Widget dialog) {
    SchedulerBinding.instance?.addPostFrameCallback(
      (_) async => showModal<void>(
        context: context,
        configuration: const FadeScaleTransitionConfiguration(
          transitionDuration: Duration(milliseconds: 400),
          reverseTransitionDuration: Duration(milliseconds: 200),
        ),
        useRootNavigator: true,
        builder: (_) => dialog,
      ),
    );
  }

  @override
  Widget build(BuildContext context) => PopupMenuButton<void>(
        icon: const Icon(Icons.more_vert),
        itemBuilder: (_) => [
          PopupMenuItem(
            onTap: () => showDialog(context, const SettingsDialog()),
            child: Text(AppLocalizations.of(context).settings),
          ),
          PopupMenuItem(
            onTap: () => showDialog(context, const AboutAppDialog()),
            child: Text(AppLocalizations.of(context).help),
          ),
        ],
      );
}
