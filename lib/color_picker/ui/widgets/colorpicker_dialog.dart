import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show TextInputFormatter;
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:platform_info/platform_info.dart';

import '../../../core/services/clipboards.dart';
import '../../helpers/hex_formatter.dart';

class ColorpickerDialog extends StatefulWidget {
  final Clipboards clipboard;
  final Color color;
  final ValueSetter<Color> onColorChanged;

  const ColorpickerDialog(
    this.color, {
    required this.onColorChanged,
    this.clipboard = const Clipboards(),
    Key? key,
  }) : super(key: key);

  @override
  _ColorpickerDialogState createState() => _ColorpickerDialogState();
}

class _ColorpickerDialogState extends State<ColorpickerDialog> {
  bool hasError = false;
  final TextEditingController hexController = TextEditingController();
  late Color selectedColor;

  bool get hidePickerArea {
    final double heightAvailable = MediaQuery.of(context).size.height - keyboardHeight;

    return isMobile && heightAvailable < 480;
  }

  bool get isMobile => platform.isMobile;
  double get keyboardHeight => MediaQuery.of(context).viewInsets.bottom;
  bool get keyboardIsVisible => keyboardHeight != 0;
  double get pickerAreaHeightPercent => hidePickerArea ? (keyboardIsVisible ? 0 : 1) : 1;

  void hideErrorMessage() {
    if (hasError) {
      setState(() => hasError = false);
    }
  }

  void setColorFromHex() {
    final Color? color = colorFromHex(hexController.text);
    if (color != null) {
      widget.onColorChanged(color);
      selectedColor = color;
    }
  }

  Future<void> validateAndPaste() async {
    final String? clipboardData = await widget.clipboard.data;
    final String? pastedText = HexFormatter.formatCompleteInput(clipboardData);
    if (pastedText != null) {
      hexController.text = pastedText;
      hideErrorMessage();
    } else {
      setColorFromHex();
      setState(() => hasError = true);
      Future<void>.delayed(const Duration(seconds: 4), () {
        if (mounted) {
          setColorFromHex();
          hideErrorMessage();
        }
      });
    }
  }

  @override
  void dispose() {
    hexController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    selectedColor = widget.color;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SimpleDialog(
        contentPadding: EdgeInsets.zero,
        children: <Widget>[
          if (hidePickerArea) const SizedBox(height: 12),
          ColorPicker(
            pickerAreaHeightPercent: pickerAreaHeightPercent,
            colorPickerWidth: 280, //because stepWidth = 56 * 5.
            displayThumbColor: true,
            portraitOnly: true,
            enableAlpha: false,
            labelTypes: const <ColorLabelType>[],
            pickerColor: selectedColor,
            hexInputController: hexController,
            onColorChanged: widget.onColorChanged,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: TextFormField(
              controller: hexController,
              maxLength: 6,
              autofocus: !isMobile,
              autocorrect: false,
              enableSuggestions: false,
              enableIMEPersonalizedLearning: false,
              onTap: setColorFromHex,
              onFieldSubmitted: (_) => Navigator.of(context).pop(),
              textAlignVertical: TextAlignVertical.center,
              scrollPadding: const EdgeInsets.only(bottom: 20),
              inputFormatters: <TextInputFormatter>[HexFormatter()],
              decoration: InputDecoration(
                errorText: hasError ? AppLocalizations.of(context).invalidHexErrorLabel : null,
                prefixIcon: const Icon(Icons.tag),
                hintText: AppLocalizations.of(context).hexHintTextLabel,
                suffixIcon: IconButton(
                  tooltip: MaterialLocalizations.of(context).pasteButtonLabel,
                  onPressed: validateAndPaste,
                  icon: Icon(
                    Icons.content_paste_outlined,
                    color: Theme.of(context).textTheme.bodyText1?.color,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
