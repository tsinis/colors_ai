import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/theme/constants.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../testing/test_keys.dart';
import '../../../vibration/blocs/vibration_bloc.dart';
import '../../../vibration/ui/widgets/vibration_disable_switch.dart';
import '../../blocs/settings_bloc.dart';
import '../../extensions/string_selected_api_extension.dart';
import '../../mixins/huemint_settings.dart';
import '../../models/selected_api.dart';
import '../widgets/gradient_slider_shape.dart';

class SettingsDialog extends StatelessWidget {
  static const TextStyle _tightSpaceStyle = TextStyle(letterSpacing: 0.5, height: 1.2);
  const SettingsDialog({super.key});

  void _onPressed(BuildContext context) {
    BlocProvider.of<SettingsBloc>(context)
      ..add(const SettingsEvent.systemThemeSelected())
      ..add(const SettingsEvent.colorsRegularSelected())
      ..add(const SettingsEvent.apiSelected(SelectedAPI.colormind))
      ..add(const SettingsEvent.temperatureSelected(HuemintSettings.temperatureMax / 2))
      ..add(const SettingsEvent.adjacencyChanged(HuemintSettings.adjacencyMax ~/ 2));
    BlocProvider.of<VibrationBloc>(context).add(const VibrationEvent.settingsChanged(isEnabled: true));
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<SettingsBloc, SettingsState>(
        builder: (_, SettingsState state) => AlertDialog(
          actionsPadding: const EdgeInsets.only(bottom: 16, right: 16),
          shape: kDefaultShape,
          scrollable: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          title: Text(context.l10n.settings),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: DropdownButtonFormField<SelectedAPI>(
                  key: TestKeys.settingsDialogDropdownMenu,
                  isExpanded: true,
                  dropdownColor: context.theme.dialogBackgroundColor,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: context.theme.splashColor,
                    labelText: context.l10n.selectAiProvider,
                    labelStyle: _tightSpaceStyle.copyWith(fontSize: 14),
                    helperStyle: _tightSpaceStyle.copyWith(fontSize: 12),
                    helperMaxLines: 1,
                    helperText: state.selectedAPI.helperText(context.l10n),
                  ),
                  value: state.selectedAPI,
                  onChanged: (SelectedAPI? api) =>
                      BlocProvider.of<SettingsBloc>(context).add(SettingsEvent.apiSelected(api)),
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
                    title: Text(context.l10n.colorsForUiTitle, style: _tightSpaceStyle),
                    subtitle: Text(
                      context.l10n.colorsForUiSubtitle,
                      style: _tightSpaceStyle,
                    ),
                    activeColor: context.theme.indicatorColor,
                    value: state.colormindForUI,
                    onChanged: (bool isForUi) => BlocProvider.of<SettingsBloc>(context).add(
                      isForUi ? const SettingsEvent.colorsForUiSelected() : const SettingsEvent.colorsRegularSelected(),
                    ),
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
                        title: Text(context.l10n.adjacency),
                        subtitle: SliderTheme(
                          data: SliderThemeData(
                            valueIndicatorColor: context.theme.primaryColor,
                            valueIndicatorTextStyle: TextStyle(color: context.theme.primaryColorLight),
                          ),
                          child: Slider(
                            value: state.huemintAdjacency.toDouble(),
                            label: state.huemintAdjacency.toString(),
                            divisions: HuemintSettings.adjacencyMax,
                            onChanged: (double adjacency) => BlocProvider.of<SettingsBloc>(context)
                                .add(SettingsEvent.adjacencyChanged(adjacency.toInt())),
                            max: HuemintSettings.adjacencyMax.toDouble(),
                          ),
                        ),
                      ),
                      ListTile(
                        dense: true,
                        title: Text(context.l10n.temperature),
                        subtitle: SliderTheme(
                          data: const SliderThemeData(trackShape: GradientSliderShape()),
                          child: Slider(
                            value: state.huemintTemperature,
                            label: state.huemintTemperature.toString(),
                            onChanged: (double temperature) => BlocProvider.of<SettingsBloc>(context)
                                .add(SettingsEvent.temperatureSelected(temperature)),
                            max: HuemintSettings.temperatureMax,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Divider(height: 1, color: context.theme.colorScheme.primary),
              const VibrationDisableSwitch(style: _tightSpaceStyle),
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 8, top: 12),
                child: Text(context.l10n.appearance),
              ),
              RadioListTile<bool?>(
                key: TestKeys.lightThemeSelection,
                dense: true,
                title: Text(context.l10n.lightThemeTitle),
                contentPadding: const EdgeInsets.only(right: 32, left: 16),
                subtitle: Text(context.l10n.lightThemeSubtitle, style: _tightSpaceStyle),
                value: false,
                groupValue: state.isDarkTheme,
                onChanged: (_) => BlocProvider.of<SettingsBloc>(context).add(const SettingsEvent.lightThemeSelected()),
              ),
              RadioListTile<bool?>(
                key: TestKeys.darkThemeSelection,
                dense: true,
                title: Text(context.l10n.darkThemeTitle),
                subtitle: Text(context.l10n.darkThemeSubtitle, style: _tightSpaceStyle),
                value: true,
                groupValue: state.isDarkTheme,
                onChanged: (_) => BlocProvider.of<SettingsBloc>(context).add(const SettingsEvent.darkThemeSelected()),
              ),
              Flexible(
                child: RadioListTile<bool?>(
                  key: TestKeys.systemThemeSelection,
                  dense: true,
                  title: Text(context.l10n.systemThemeTitle),
                  subtitle: Text(context.l10n.systemThemeSubtitle, style: _tightSpaceStyle),
                  value: null,
                  groupValue: state.isDarkTheme,
                  onChanged: (_) =>
                      BlocProvider.of<SettingsBloc>(context).add(const SettingsEvent.systemThemeSelected()),
                ),
              ),
            ],
          ),
          actions: <TextButton>[
            TextButton(
              key: TestKeys.resetSettingsButton,
              onPressed: () => _onPressed(context),
              child: Text(
                context.l10n.resetButtonLabel,
                style: TextStyle(color: context.theme.colorScheme.error),
              ),
            ),
            TextButton(
              key: TestKeys.closeSettingsButton,
              onPressed: context.closeDialog<void>,
              child: Text(context.materialL10n.closeButtonLabel.toBeginningOfSentenceCase()),
            ),
          ],
        ),
      );
}
