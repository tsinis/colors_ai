import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../app/theme/constants.dart';
import '../../../core/extensions/string_extension.dart';
import '../../blocs/settings_bloc.dart';

class SettingsDialog extends StatelessWidget {
  const SettingsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<SettingsBloc, SettingsState>(
        builder: (_, SettingsState state) => AlertDialog(
          actionsPadding: const EdgeInsets.only(bottom: 8, right: 8),
          shape: kDefaultShape,
          scrollable: true,
          contentPadding: const EdgeInsets.only(bottom: 16, top: 16),
          title: Text(AppLocalizations.of(context).settings),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SwitchListTile(
                dense: true,
                title: Text(AppLocalizations.of(context).colorsForUiTitle),
                subtitle: Text(AppLocalizations.of(context).colorsForUiSubtitle),
                activeColor: Theme.of(context).indicatorColor,
                value: state.colorsForUi,
                onChanged: (bool isForUi) {
                  if (isForUi) {
                    BlocProvider.of<SettingsBloc>(context).add(
                      const SettingsColorsForUiSelected(),
                    );
                  } else {
                    BlocProvider.of<SettingsBloc>(context).add(
                      const SettingsRegularColorsSelected(),
                    );
                  }
                },
              ),
              const SizedBox(height: 8),
              const Divider(height: 1),
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 8, top: 12),
                child: Text(AppLocalizations.of(context).appearance, style: const TextStyle(fontSize: 14)),
              ),
              RadioListTile<bool?>(
                dense: true,
                title: Text(AppLocalizations.of(context).lightThemeTitle),
                contentPadding: const EdgeInsets.only(right: 32, left: 16),
                subtitle: Text(AppLocalizations.of(context).lightThemeSubtitle),
                value: false,
                groupValue: state.isDarkTheme,
                onChanged: (_) => BlocProvider.of<SettingsBloc>(context).add(const SettingsLightThemeSelected()),
              ),
              RadioListTile<bool?>(
                dense: true,
                title: Text(AppLocalizations.of(context).darkThemeTitle),
                subtitle: Text(AppLocalizations.of(context).darkThemeSubtitle),
                value: true,
                groupValue: state.isDarkTheme,
                onChanged: (_) => BlocProvider.of<SettingsBloc>(context).add(const SettingsDarkThemeSelected()),
              ),
              Flexible(
                child: RadioListTile<bool?>(
                  dense: true,
                  title: Text(AppLocalizations.of(context).systemThemeTitle),
                  subtitle: Text(AppLocalizations.of(context).systemThemeSubtitle),
                  value: null,
                  groupValue: state.isDarkTheme,
                  onChanged: (_) => BlocProvider.of<SettingsBloc>(context).add(const SettingsSystemThemeSelected()),
                ),
              ),
            ],
          ),
          actions: <TextButton>[
            TextButton(
              onPressed: () {
                BlocProvider.of<SettingsBloc>(context).add(const SettingsSystemThemeSelected());
                BlocProvider.of<SettingsBloc>(context).add(const SettingsRegularColorsSelected());
              },
              child: Text(
                AppLocalizations.of(context).resetButtonLabel,
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(MaterialLocalizations.of(context).closeButtonLabel.toBeginningOfSentenceCase()),
            ),
          ],
        ),
      );
}
