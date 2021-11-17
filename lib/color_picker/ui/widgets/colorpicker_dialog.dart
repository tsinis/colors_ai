import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:platform_info/platform_info.dart';

import '../../../core/services/clipboard.dart';
import '../../helpers/hex_formatter.dart';

class ColorpickerDialog extends StatefulWidget {
  const ColorpickerDialog(this.color, {required this.onColorChanged});

  final Color color;
  final ValueSetter<Color> onColorChanged;

  @override
  _ColorpickerDialogState createState() => _ColorpickerDialogState();
}

class _ColorpickerDialogState extends State<ColorpickerDialog> {
  static const Clipboards clipboard = Clipboards();
  final TextEditingController hexController = TextEditingController();
  bool hasError = false;
  late Color selectedColor;

  @override
  void initState() {
    selectedColor = widget.color;
    super.initState();
  }

  @override
  void dispose() {
    hexController.dispose();
    super.dispose();
  }

  Future<void> validateAndPaste() async {
    final String? pastedText = HexFormatter.formatCompleteInput(await clipboard.data);
    if (pastedText != null) {
      hexController.text = pastedText;
      hideErrorMessage();
    } else {
      setColorFromHex();
      setState(() => hasError = true);
      Future.delayed(const Duration(seconds: 4), () {
        if (mounted) {
          setColorFromHex();
          hideErrorMessage();
        }
      });
    }
  }

  void setColorFromHex() {
    final Color? color = colorFromHex(hexController.text);
    if (color != null) {
      widget.onColorChanged(color);
      selectedColor = color;
    }
  }

  void hideErrorMessage() {
    if (hasError) {
      setState(() => hasError = false);
    }
  }

  double get keyboardHeight => MediaQuery.of(context).viewInsets.bottom;
  double get pickerAreaHeightPercent => hidePickerArea ? (keyboardIsVisible ? 0 : 1) : 1;

  bool get keyboardIsVisible => keyboardHeight != 0;
  bool get isMobile => platform.isMobile;
  bool get hidePickerArea {
    final double heightAvailable = MediaQuery.of(context).size.height - keyboardHeight;

    return isMobile && heightAvailable < 480;
  }

  @override
  Widget build(BuildContext context) => SimpleDialog(
        // shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(28))),
        contentPadding: EdgeInsets.zero,
        children: [
          if (hidePickerArea) const SizedBox(height: 12),
          ColorPicker(
            pickerAreaHeightPercent: pickerAreaHeightPercent,
            colorPickerWidth: 280, //beacuse stepWidth = 56 * 5.
            displayThumbColor: true,
            portraitOnly: true,
            enableAlpha: false,
            labelTypes: const [],
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
              inputFormatters: [HexFormatter()],
              decoration: InputDecoration(
                errorText: hasError ? AppLocalizations.of(context).invalidHexErrorLabel : null,
                prefixIcon: const Icon(Icons.tag),
                hintText: AppLocalizations.of(context).hexHintTextLabel,
                suffixIcon: IconButton(
                  tooltip: MaterialLocalizations.of(context).pasteButtonLabel,
                  onPressed: () async => validateAndPaste(),
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
