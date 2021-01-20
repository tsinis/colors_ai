import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../blocs/colorpicker_dialog/colorpicker_bloc.dart';
import '../../blocs/colorpicker_dialog/colorpicker_event.dart';
import '../../blocs/colorpicker_dialog/colorpicker_state.dart';
import '../../blocs/colors_generated/colors_bloc.dart';
import '../../blocs/colors_generated/colors_event.dart';
import '../../blocs/colors_locked/locked_bloc.dart';
import '../../blocs/colors_locked/locked_event.dart';
import '../../blocs/floating_action_button/fab_bloc.dart';
import '../../blocs/floating_action_button/fab_event.dart';
import '../../extensions/color_to_hex.dart';

class Colorpicker extends StatelessWidget {
  const Colorpicker(
    this.index, {
    required this.color,
    required this.textColor,
    required this.buttonSize,
  });

  final Color color, textColor;
  final int index;
  final Size buttonSize;

  @override
  Widget build(BuildContext context) => BlocProvider<ColorPickerBLoc>(
        create: (_) => ColorPickerBLoc(),
        child: BlocBuilder<ColorPickerBLoc, ColorPickerState>(
          builder: (BuildContext dialogContext, ColorPickerState state) {
            if (state is ColorPickerShowingState) {
              SchedulerBinding.instance?.addPostFrameCallback((_) async {
                await showDialog<void>(
                  context: dialogContext,
                  builder: (_) => SimpleDialog(
                    // https://material.io/components/dialogs#simple-dialog
                    contentPadding: const EdgeInsets.all(0),
                    children: [
                      ColorPicker(
                        colorPickerWidth: 280, //beacuse stepWidth = 56 * 5.
                        enableAlpha: false,
                        portraitOnly: true,
                        displayThumbColor: true,
                        pickerColor: color,
                        onColorChanged: (newColor) {
                          BlocProvider.of<FabBloc>(context).add(const FabShowEvent());
                          BlocProvider.of<ColorsBloc>(context).add(ColorsChangeEvent(newColor, index));
                        },
                      ),
                    ],
                  ),
                );
              });
              BlocProvider.of<ColorPickerBLoc>(dialogContext).add(const VisibleColorPicker());
            }
            return TextButton(
                style: ButtonStyle(enableFeedback: true, minimumSize: MaterialStateProperty.all<Size>(buttonSize)),
                onPressed: () {
                  BlocProvider.of<ColorPickerBLoc>(dialogContext).add(const ShowColorPicker());
                  BlocProvider.of<LockedBloc>(dialogContext).add(ChangeLockEvent(index, onlyLock: true));
                },
                child:
                    Text(color.toHex(), maxLines: 1, textAlign: TextAlign.center, style: TextStyle(color: textColor)));
          },
        ),
      );
}
