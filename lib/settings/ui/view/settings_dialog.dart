import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../blocs/settings_hydrated_bloc.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton();

  @override
  Widget build(BuildContext context) => IconButton(
      // tooltip: AppLocalizations.of(context).SettingsThisAppTooltip, //TODO
      icon: const Icon(Icons.settings_outlined),
      onPressed: () {
        SchedulerBinding.instance?.addPostFrameCallback(
          (_) async => showModal<void>(
            context: context,
            configuration: const FadeScaleTransitionConfiguration(
              transitionDuration: Duration(milliseconds: 400),
              reverseTransitionDuration: Duration(milliseconds: 200),
            ),
            useRootNavigator: true,
            builder: (_) => SimpleDialog(
              children: <Widget>[
                RadioListTile<bool?>(
                  dense: true,
                  title: const Text('Light'),
                  // subtitle: Text(AppLocalizations.of(context).a4DimensionsSubtitle),
                  value: false,
                  groupValue: BlocProvider.of<SettingsBloc>(context).state.isDarkTheme,
                  onChanged: (_) => BlocProvider.of<SettingsBloc>(context).add(const SettingsLightThemeSelected()),
                ),
                RadioListTile<bool?>(
                  dense: true,
                  title: const Text('Dark'),
                  // subtitle: Text(AppLocalizations.of(context).letterDimensionsSubtitle),
                  value: true,
                  groupValue: BlocProvider.of<SettingsBloc>(context).state.isDarkTheme,
                  onChanged: (_) => BlocProvider.of<SettingsBloc>(context).add(const SettingsDarkThemeSelected()),
                ),
                RadioListTile<bool?>(
                  dense: true,
                  title: const Text('System'),
                  // subtitle: Text(AppLocalizations.of(context).letterDimensionsSubtitle),
                  value: null,
                  groupValue: BlocProvider.of<SettingsBloc>(context).state.isDarkTheme,
                  onChanged: (_) => BlocProvider.of<SettingsBloc>(context).add(const SettingsSystemThemeSelected()),
                ),
              ],
            ),
          ),
        );
      });
}
