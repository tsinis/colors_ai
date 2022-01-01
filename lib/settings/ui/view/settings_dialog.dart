import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../app/theme/constants.dart';
import '../../../core/extensions/string_extension.dart';
import '../../blocs/settings_bloc.dart';
import '../../extensions/string_selected_api_extension.dart';
import '../../mixins/huemint_settings.dart';
import '../../models/selected_api.dart';
import '../widgets/gradient_slider_shape.dart';

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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: DropdownButtonFormField<SelectedAPI>(
                  isExpanded: true,
                  dropdownColor: Theme.of(context).dialogBackgroundColor,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).splashColor,
                    labelText: AppLocalizations.of(context).selectAiProvider,
                    helperStyle: const TextStyle(fontSize: 12),
                    helperMaxLines: 1,
                    helperText: state.selectedAPI.helperText(AppLocalizations.of(context)),
                  ),
                  value: state.selectedAPI,
                  onChanged: (SelectedAPI? api) => BlocProvider.of<SettingsBloc>(context).add(SettingsApiSelected(api)),
                  items: List<DropdownMenuItem<SelectedAPI>>.generate(
                    SelectedAPI.values.length,
                    (int index) => DropdownMenuItem<SelectedAPI>(
                      value: SelectedAPI.values.elementAt(index),
                      child: Text(SelectedAPI.values.elementAt(index).name.toBeginningOfSentenceCase()),
                    ),
                    growable: false,
                  ),
                ),
              ),
              AnimatedCrossFade(
                crossFadeState:
                    (state.selectedAPI == SelectedAPI.colormind) ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration: kDefaultShortTransitionDuration,
                firstCurve: kDefaultTransitionCurve,
                secondCurve: kDefaultTransitionCurve,
                firstChild: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: SwitchListTile(
                    dense: true,
                    title: Text(AppLocalizations.of(context).colorsForUiTitle),
                    subtitle: Text(AppLocalizations.of(context).colorsForUiSubtitle),
                    activeColor: Theme.of(context).indicatorColor,
                    value: state.colormindForUI,
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
                ),
                secondChild: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <ListTile>[
                      ListTile(
                        dense: true,
                        title: Text(AppLocalizations.of(context).adjacency),
                        subtitle: SliderTheme(
                          data: SliderThemeData(
                            valueIndicatorColor: Theme.of(context).primaryColor,
                            valueIndicatorTextStyle: TextStyle(color: Theme.of(context).primaryColorLight),
                          ),
                          child: Slider(
                            value: state.huemintAdjacency.toDouble(),
                            label: state.huemintAdjacency.toString(),
                            divisions: HuemintSettings.adjacencyMax,
                            onChanged: (double adjacency) =>
                                BlocProvider.of<SettingsBloc>(context).add(SettingsAdjacencyChanged(adjacency.toInt())),
                            max: HuemintSettings.adjacencyMax.toDouble(),
                          ),
                        ),
                      ),
                      ListTile(
                        dense: true,
                        title: Text(AppLocalizations.of(context).temperature),
                        subtitle: SliderTheme(
                          data: const SliderThemeData(trackShape: GradientSliderShape()),
                          child: Slider(
                            value: state.huemintTemperature,
                            label: state.huemintTemperature.toString(),
                            onChanged: (double temperature) =>
                                BlocProvider.of<SettingsBloc>(context).add(SettingsTemperatureChanged(temperature)),
                            max: HuemintSettings.temperatureMax,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Divider(height: 1),
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 8, top: 12),
                child: Text(AppLocalizations.of(context).appearance),
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
              onPressed: () => BlocProvider.of<SettingsBloc>(context)
                ..add(const SettingsSystemThemeSelected())
                ..add(const SettingsRegularColorsSelected())
                ..add(const SettingsApiSelected(SelectedAPI.colormind))
                ..add(const SettingsTemperatureChanged(HuemintSettings.temperatureMax / 2))
                ..add(const SettingsAdjacencyChanged(HuemintSettings.adjacencyMax ~/ 2)),
              child: Text(
                AppLocalizations.of(context).resetButtonLabel,
                style: TextStyle(color: Theme.of(context).errorColor),
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
