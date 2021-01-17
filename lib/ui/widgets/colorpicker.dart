import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../blocs/colorpicker_dialog/colorpicker_bloc.dart';
import '../../blocs/colorpicker_dialog/colorpicker_event.dart';
import '../../blocs/colorpicker_dialog/colorpicker_state.dart';
import '../../blocs/colors_generated/colors_bloc.dart';
import '../../blocs/colors_generated/colors_event.dart';
import '../../blocs/fab_bloc/fab_bloc.dart';
import '../../blocs/fab_bloc/fab_event.dart';
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
  Widget build(BuildContext context) => BlocProvider<DialogBloc>(
        create: (_) => DialogBloc(),
        child: BlocBuilder<DialogBloc, DialogState>(
          builder: (BuildContext dialogContext, DialogState state) {
            if (state is DialogShowing) {
              SchedulerBinding.instance?.addPostFrameCallback((_) async {
                await showDialog<void>(
                  context: dialogContext,
                  builder: (_) => SimpleDialog(
                    // https://material.io/components/dialogs#simple-dialog
                    contentPadding: const EdgeInsets.all(0),
                    children: [
                      ColorPicker(
                        colorPickerWidth: 332,
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
              BlocProvider.of<DialogBloc>(dialogContext).add(const VisibleDialog());
            }
            return TextButton(
                style: ButtonStyle(enableFeedback: true, minimumSize: MaterialStateProperty.all<Size>(buttonSize)),
                onPressed: () => BlocProvider.of<DialogBloc>(dialogContext).add(const ShowDialog()),
                child:
                    Text(color.toHex(), maxLines: 1, textAlign: TextAlign.center, style: TextStyle(color: textColor)));
          },
        ),
      );
}
