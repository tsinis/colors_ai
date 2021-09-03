import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../../color_generator/blocs/colors_generated/colors_bloc.dart';
import '../../../color_generator/blocs/colors_locked/locked_bloc.dart';
import '../../../common/blocs/snackbars/snackbars_bloc.dart';
import '../../../core/extensions/color.dart';
import '../../../favorites/blocs/add_favorites/fab_bloc.dart';
import '../../../sound/blocs/sounds_vibration/sound_bloc.dart';
import '../../blocs/colorpicker_dialog/colorpicker_bloc.dart';
import '../../helpers/hex_formatter.dart';

class Colorpicker extends StatelessWidget {
  const Colorpicker(
    this.index, {
    required this.color,
    required this.textColor,
    required this.buttonSize,
    required this.isPortrait,
  });

  final Color color, textColor;
  final int index;
  final Size buttonSize;
  final bool isPortrait;

  @override
  Widget build(BuildContext context) => BlocProvider<ColorPickerBLoc>(
        create: (_) => ColorPickerBLoc(),
        child: BlocBuilder<ColorPickerBLoc, ColorPickerState>(
          builder: (dialogContext, state) {
            if (state is ColorPickerOpenInitial) {
              SchedulerBinding.instance?.addPostFrameCallback(
                (_) async => showModal<void>(
                  context: dialogContext,
                  configuration: const FadeScaleTransitionConfiguration(
                    barrierColor: Colors.transparent,
                    transitionDuration: Duration(milliseconds: 400),
                    reverseTransitionDuration: Duration(milliseconds: 200),
                  ),
                  builder: (_) {
                    final TextEditingController hexController = TextEditingController();
                    return SimpleDialog(
                      contentPadding: const EdgeInsets.all(0),
                      children: [
                        ColorPicker(
                          colorPickerWidth: 280, //beacuse stepWidth = 56 * 5.
                          enableAlpha: false,
                          portraitOnly: true,
                          displayThumbColor: true,
                          showLabel: false,
                          pickerColor: color,
                          hexInputController: hexController,
                          onColorChanged: (newColor) {
                            BlocProvider.of<FabBloc>(context).add(const FabShowed());
                            BlocProvider.of<ColorsBloc>(context)
                                .add(ColorsChanged(newColor, index));
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                          child: TextFormField(
                            controller: hexController,
                            autofocus: true,
                            maxLength: 6,
                            //TODO: Add validator.
                            autocorrect: false,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.tag),
                              suffixIcon: IconButton(
                                tooltip: MaterialLocalizations.of(context).pasteButtonLabel,
                                icon: Icon(
                                  Icons.content_paste_outlined,
                                  color: Theme.of(context).textTheme.bodyText1?.color,
                                ),
                                onPressed: () async {
                                  final text = HexFormatter.formatCompleteInput(
                                      (await Clipboard.getData('text/plain'))?.text);
                                  if (text != null) {
                                    hexController.text = text;
                                  }
                                },
                              ),
                            ),
                            inputFormatters: [HexFormatter()],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
              BlocProvider.of<ColorPickerBLoc>(dialogContext).add(const ColorPickerHided());
            }
            return TextButton(
              style: ButtonStyle(
                  enableFeedback: true,
                  minimumSize: MaterialStateProperty.all<Size>(buttonSize),
                  maximumSize: MaterialStateProperty.all<Size>(buttonSize)),
              onLongPress: isPortrait
                  ? () {
                      BlocProvider.of<ColorPickerBLoc>(context).add(ColorPickerCopied(color));
                      BlocProvider.of<SnackbarBloc>(context).add(const ColorCopiedSuccess());
                    }
                  : null,
              onPressed: () {
                BlocProvider.of<ColorPickerBLoc>(dialogContext).add(const ColorPickerShowed());
                BlocProvider.of<SoundBloc>(dialogContext).add(const SoundLocked());
                BlocProvider.of<LockedBloc>(dialogContext).add(LockChanged(index, onlyLock: true));
              },
              child: Align(
                alignment: isPortrait ? Alignment.centerLeft : Alignment.topCenter,
                child: SizedBox(
                  height: buttonSize.height / 3,
                  width: buttonSize.width,
                  child: Center(
                    child: GestureDetector(
                      onTap: isPortrait
                          ? null
                          : () {
                              BlocProvider.of<ColorPickerBLoc>(context)
                                  .add(ColorPickerCopied(color));
                              BlocProvider.of<SnackbarBloc>(context)
                                  .add(const ColorCopiedSuccess());
                            },
                      child: Text(color.toHex(),
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: textColor)),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
}
