import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/blocs/snackbars/snackbar_bloc.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../../../core/models/color_palette/color_palette.dart';
import '../../../blocs/share_bloc.dart';
import '../../../extensions/file_format_extension.dart';
import '../../../models/file_format.dart';
import 'share_section_interface.dart';

class FileShareSection extends ShareSectionInterface {
  final String? additionalInfo;
  final bool canSharePdf;
  final bool canSharePng;
  final FileFormat selectedFormat;

  bool get _cannotCopy => selectedFormat.isPrintable;

  const FileShareSection(
    ColorPalette palette, {
    required double width,
    required this.selectedFormat,
    required this.canSharePdf,
    required this.canSharePng,
    this.additionalInfo,
    Key? key,
  }) : super(key: key, maxWidth: width, palette: palette);

  @override
  Widget build(BuildContext context) {
    final bool isPortrait = context.media.orientation == Orientation.portrait;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: isPortrait ? maxWidth : maxWidth * 0.32),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 16),
            child: DropdownButtonFormField<FileFormat>(
              isExpanded: !isPortrait,
              isDense: isPortrait,
              dropdownColor: context.theme.dialogBackgroundColor,
              decoration: InputDecoration(
                filled: true,
                fillColor: context.theme.splashColor,
                labelText: context.l10n.shareFile,
                helperStyle: const TextStyle(fontSize: 12),
                helperMaxLines: 1,
                helperText: _helperText(context.l10n),
              ),
              value: selectedFormat,
              onChanged: (FileFormat? newFormat) =>
                  BlocProvider.of<ShareBloc>(context).add(ShareEvent.formatSelected(format: newFormat)),
              items: List<DropdownMenuItem<FileFormat>>.generate(
                FileFormat.values.length,
                (int index) {
                  final FileFormat fileFormat = FileFormat.values.elementAt(index);

                  return DropdownMenuItem<FileFormat>(
                    value: fileFormat,
                    child: Text(fileFormat.title),
                  );
                },
                growable: false,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ButtonBar(
              mainAxisSize: MainAxisSize.max,
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.content_copy_outlined, size: 20),
                    label: Text(context.l10n.copyAsFormat(selectedFormat.format)),
                    onPressed: _cannotCopy
                        ? null
                        : () {
                            BlocProvider.of<ShareBloc>(context).add(ShareEvent.fileCopied(palette));
                            BlocProvider.of<SnackbarBloc>(context).add(SnackbarEvent.fileCopied(selectedFormat.format));
                          },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.link, size: 20),
                    label: Text(_shareOrSaveButtonLabel(context)),
                    onPressed: () => BlocProvider.of<ShareBloc>(context).add(ShareEvent.fileShared(palette)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String? _helperText(AppLocalizations l10n) {
    switch (selectedFormat) {
      case FileFormat.pdfA4:
      case FileFormat.pngA4:
        return l10n.a4DimensionsSubtitle;
      case FileFormat.pngLetter:
      case FileFormat.pdfLetter:
        return l10n.letterDimensionsSubtitle;
      case FileFormat.svg:
        return 'Scalable Vector Graphics';
      case FileFormat.json:
        return 'JavaScript Object Notation';
      case FileFormat.scss:
        return 'Sassy Cascading Style Sheets';
    }
  }

  String _shareOrSaveButtonLabel(BuildContext context) => !kIsWeb && (Platform.isWindows || Platform.isLinux)
      ? '${context.materialL10n.saveButtonLabel.toBeginningOfSentenceCase()} ${selectedFormat.format}'
      : context.l10n.shareAsFormat(selectedFormat.format);
}
