import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/models/color_palette/color_palette.dart';
import '../../../blocs/share/share_hydrated_bloc.dart';
import 'share_section_interface.dart';

class FileShareSection extends ShareSection {
  const FileShareSection(
    ColorPalette palette, {
    required double width,
    required this.canSharePng,
    this.isLetter,
  }) : super(maxWidth: width, palette: palette);

  final bool? isLetter;
  final bool canSharePng;

  @override
  Widget build(BuildContext context) {
    final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: isPortrait ? maxWidth : maxWidth * 0.32),
      child: Column(
        children: [
          if (isPortrait) const Divider() else const SizedBox(height: 24),
          RadioListTile<bool>(
            dense: true,
            title: RichText(
              textScaleFactor: MediaQuery.of(context).textScaleFactor,
              text: TextSpan(
                text: 'A4',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: ' ${AppLocalizations.of(context).a4DimensionsTitle}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
                  )
                ],
              ),
            ),
            subtitle: Text(AppLocalizations.of(context).a4DimensionsSubtitle),
            value: false,
            groupValue: isLetter ?? false,
            onChanged: (isLetterSelected) {
              if (isLetterSelected != null) {
                BlocProvider.of<ShareBloc>(context).add(ShareFormatSelected(isLetter: isLetterSelected));
              }
            },
          ),
          RadioListTile<bool>(
            dense: true,
            title: RichText(
              textScaleFactor: MediaQuery.of(context).textScaleFactor,
              text: TextSpan(
                text: AppLocalizations.of(context).letterLabel,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
                children: [
                  TextSpan(
                    text: ' ${AppLocalizations.of(context).letterDimensionsTitle}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
                  )
                ],
              ),
            ),
            subtitle: Text(AppLocalizations.of(context).letterDimensionsSubtitle),
            value: true,
            groupValue: isLetter ?? false,
            onChanged: (isLetterSelected) {
              if (isLetterSelected != null) {
                BlocProvider.of<ShareBloc>(context).add(ShareFormatSelected(isLetter: isLetterSelected));
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ButtonBar(
              mainAxisSize: MainAxisSize.max,
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.image_outlined, size: 20),
                    label: Text(AppLocalizations.of(context).sharePngButtonLabel.toUpperCase()),
                    onPressed:
                        canSharePng ? () => BlocProvider.of<ShareBloc>(context).add(ShareImageShared(palette)) : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.picture_as_pdf_outlined, size: 20),
                    label: Text(AppLocalizations.of(context).sharePdfButtonLabel.toUpperCase()),
                    onPressed: () => BlocProvider.of<ShareBloc>(context).add(SharePdfShared(palette)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
