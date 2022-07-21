import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show SchedulerBinding;

import '../../../about/ui/view/about_app_dialog.dart';
import '../../../app/theme/constants.dart';
import '../../../settings/ui/view/settings_dialog.dart';
import '../../extensions/context_extensions.dart';

class OverflowMenu extends StatelessWidget {
  const OverflowMenu({super.key});

  void showDialog(BuildContext context, Widget dialog) {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) async => showModal<void>(
        context: context,
        builder: (_) => dialog,
        configuration: const FadeScaleTransitionConfiguration(
          transitionDuration: kDefaultTransitionDuration,
          reverseTransitionDuration: kDefaultReverseTransitionDuration,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => PopupMenuButton<void>(
        icon: const Icon(Icons.more_vert),
        itemBuilder: (_) => <PopupMenuItem<void>>[
          PopupMenuItem<void>(
            onTap: () => showDialog(context, const SettingsDialog()),
            child: Text(context.l10n.settings),
          ),
          PopupMenuItem<void>(
            onTap: () => showDialog(context, const AboutAppDialog()),
            child: Text(context.l10n.help),
          ),
        ],
      );
}
