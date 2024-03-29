import 'dart:async';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/theme/constants.dart';
import '../../../color_generator/blocs/colors_generated/colors_bloc.dart';
import '../../../color_generator/blocs/colors_locked/lock_bloc.dart';
import '../../../common/blocs/snackbars/snackbar_bloc.dart';
import '../../../core/extensions/color_extensions.dart';
import '../../../favorites/blocs/add_favorites/fab_bloc.dart';
import '../../../sound/blocs/sound_bloc.dart';
import '../../blocs/colorpicker_bloc.dart';
import '../widgets/colorpicker_dialog.dart';

class Colorpicker extends StatelessWidget {
  final Size buttonSize;
  final Color color;
  final int index;
  final bool isPortrait;
  final Color textColor;

  const Colorpicker(
    this.index, {
    required this.color,
    required this.textColor,
    required this.buttonSize,
    required this.isPortrait,
    super.key,
  });

  void _onPressed(BuildContext context) {
    BlocProvider.of<ColorPickerBloc>(context).add(const ColorPickerEvent.showed());
    BlocProvider.of<SoundBloc>(context).add(const SoundEvent.locked());
    BlocProvider.of<LockBloc>(context).add(LockChanged(index, onlyLock: true));
  }

  void _onColorChanged(int index, Color newColor, BuildContext context) {
    BlocProvider.of<FabBloc>(context).add(const FabShowed());
    BlocProvider.of<ColorsBloc>(context).add(ColorsChanged(newColor, index));
  }

  @override
  Widget build(BuildContext context) => BlocProvider<ColorPickerBloc>(
        create: (_) => ColorPickerBloc(),
        child: BlocBuilder<ColorPickerBloc, ColorPickerState>(
          builder: (BuildContext dialogContext, ColorPickerState state) {
            state.whenOrNull(
              open: () {
                SchedulerBinding.instance.addPostFrameCallback(
                  (_) => unawaited(
                    showModal<void>(
                      context: dialogContext,
                      builder: (_) => ColorpickerDialog(
                        color,
                        onColorChanged: (Color newColor) => _onColorChanged(index, newColor, context),
                      ),
                      configuration: const FadeScaleTransitionConfiguration(
                        barrierColor: Colors.transparent,
                        transitionDuration: kDefaultTransitionDuration,
                        reverseTransitionDuration: kDefaultReverseTransitionDuration,
                      ),
                    ),
                  ),
                );
                BlocProvider.of<ColorPickerBloc>(dialogContext).add(const ColorPickerEvent.hided());
              },
            );

            final MaterialStateProperty<Size> size = MaterialStateProperty.all<Size>(buttonSize);

            return TextButton(
              style: ButtonStyle(enableFeedback: true, minimumSize: size, maximumSize: size),
              onLongPress: isPortrait
                  ? () {
                      BlocProvider.of<ColorPickerBloc>(context).add(ColorPickerEvent.copied(color));
                      BlocProvider.of<SnackbarBloc>(context).add(const SnackbarEvent.colorCopied());
                    }
                  : null,
              onPressed: () => _onPressed(dialogContext),
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
                              BlocProvider.of<ColorPickerBloc>(context).add(ColorPickerEvent.copied(color));
                              BlocProvider.of<SnackbarBloc>(context).add(const SnackbarEvent.colorCopied());
                            },
                      child: Text(
                        color.toHex(),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: textColor),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
}
