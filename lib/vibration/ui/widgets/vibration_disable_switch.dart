import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../blocs/vibration_bloc.dart';

class VibrationDisableSwitch extends StatelessWidget {
  final TextStyle? style;
  const VibrationDisableSwitch({this.style, super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<VibrationBloc, VibrationState>(
        builder: (_, VibrationState state) => Visibility(
          visible: state.when(
            initial: (bool canVibrate, __) => canVibrate,
            loadInProgress: (_) => true,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 4),
            child: SwitchListTile(
              dense: true,
              value: state.isVibrationEnabled,
              activeColor: context.theme.indicatorColor,
              title: Text(context.l10n.vibrationsTitle, style: style),
              subtitle: Text(context.l10n.vibrationsLabel, style: style),
              onChanged: (bool isVibrationEnabled) => BlocProvider.of<VibrationBloc>(context)
                  .add(VibrationEvent.settingsChanged(isEnabled: isVibrationEnabled)),
            ),
          ),
        ),
      );
}
