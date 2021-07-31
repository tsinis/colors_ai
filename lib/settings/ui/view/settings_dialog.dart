import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/settings_hydrated_bloc.dart';

class SettingsDialog extends StatelessWidget {
  const SettingsDialog();

  @override
  Widget build(BuildContext context) => BlocBuilder<SettingsBloc, SettingsState>(
        builder: (_, state) => SimpleDialog(
          children: <Widget>[
            RadioListTile<bool?>(
              dense: true,
              title: const Text('Light'),
              // subtitle: Text(AppLocalizations.of(context).a4DimensionsSubtitle),
              value: false,
              groupValue: state.isDarkTheme,
              onChanged: (_) => BlocProvider.of<SettingsBloc>(context).add(const SettingsLightThemeSelected()),
            ),
            RadioListTile<bool?>(
              dense: true,
              title: const Text('Dark'),
              // subtitle: Text(AppLocalizations.of(context).letterDimensionsSubtitle),
              value: true,
              groupValue: state.isDarkTheme,
              onChanged: (_) => BlocProvider.of<SettingsBloc>(context).add(const SettingsDarkThemeSelected()),
            ),
            RadioListTile<bool?>(
              dense: true,
              title: const Text('System'),
              // subtitle: Text(AppLocalizations.of(context).letterDimensionsSubtitle),
              value: null,
              groupValue: state.isDarkTheme,
              onChanged: (_) => BlocProvider.of<SettingsBloc>(context).add(const SettingsSystemThemeSelected()),
            ),
          ],
        ),
      );
}
