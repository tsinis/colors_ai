import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show SchedulerBinding;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../about/ui/view/about_app_dialog.dart';
import '../../../app/theme/constants.dart';
import '../../../settings/ui/view/settings_dialog.dart';

class OverflowMenu extends StatelessWidget {
  const OverflowMenu({Key? key}) : super(key: key);

  void showDialog(BuildContext context, Widget dialog) {
    SchedulerBinding.instance?.addPostFrameCallback(
      (_) async => showModal<void>(
        context: context,
        configuration: const FadeScaleTransitionConfiguration(
          transitionDuration: kDefaultTransitionDuration,
          reverseTransitionDuration: kDefaultReverseTransitionDuration,
        ),
        useRootNavigator: true,
        builder: (_) => dialog,
      ),
    );
  }

  @override
  Widget build(BuildContext context) => PopupMenuButton<void>(
        icon: const Icon(Icons.more_vert),
        itemBuilder: (_) => <PopupMenuItem<void>>[
          PopupMenuItem<void>(
            onTap: () => showDialog(context, const SettingsDialog()),
            child: Text(AppLocalizations.of(context).settings),
          ),
          PopupMenuItem<void>(
            onTap: () => showDialog(context, const AboutAppDialog()),
            child: Text(AppLocalizations.of(context).help),
          ),
        ],
      );
}
