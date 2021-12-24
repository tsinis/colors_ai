import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:platform_info/platform_info.dart';

import '../../../../common/blocs/snackbars/snackbar_bloc.dart';
import '../../../../core/models/color_palette/color_palette.dart';
import '../../../blocs/share/share_bloc.dart';
import '../../../services/url_providers/colors_url_provider.dart';
import 'share_section_interface.dart';

class UrlShareSection extends ShareSectionInterface {
  final String? exportFormats;
  final List<ColorsUrlProvider> providersList;
  final ColorsUrlProvider selectedUrlProvider;

  bool get _isNotSupportedByOS => kIsWeb || platform.isWindows || platform.isLinux;

  const UrlShareSection(
    ColorPalette palette, {
    required double width,
    required this.providersList,
    required this.selectedUrlProvider,
    required this.exportFormats,
    Key? key,
  }) : super(maxWidth: width, palette: palette, key: key);

  @override
  Widget build(BuildContext context) {
    final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: isPortrait ? maxWidth : maxWidth * 0.32),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 16),
            child: DropdownButtonFormField<ColorsUrlProvider>(
              isExpanded: !isPortrait,
              isDense: isPortrait,
              dropdownColor: Theme.of(context).dialogBackgroundColor,
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).splashColor,
                labelText: AppLocalizations.of(context).shareLinksLabel,
                helperStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                helperMaxLines: 1,
                helperText: (selectedUrlProvider == const ArtsGoogle())
                    ? AppLocalizations.of(context).googleArtsExport
                    : (exportFormats != null)
                        ? '* ${AppLocalizations.of(context).exportTo} $exportFormats'
                        : null,
              ),
              value: selectedUrlProvider,
              onChanged: (ColorsUrlProvider? newProvider) =>
                  BlocProvider.of<ShareBloc>(context).add(ShareUrlProviderSelected(urlProvider: newProvider)),
              items: List<DropdownMenuItem<ColorsUrlProvider>>.generate(
                providersList.length,
                (int index) => DropdownMenuItem<ColorsUrlProvider>(
                  value: providersList.elementAt(index),
                  child: Text.rich(
                    TextSpan(
                      text: providersList.elementAt(index).name,
                      children: (providersList.elementAt(index).formats != null)
                          ? const <TextSpan>[TextSpan(text: '*', style: TextStyle(color: Colors.grey))]
                          : null,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
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
                    label: Text(AppLocalizations.of(context).copyUrlButtonLabel),
                    onPressed: () {
                      BlocProvider.of<ShareBloc>(context).add(ShareUrlCopied(palette));
                      BlocProvider.of<SnackbarBloc>(context).add(const UrlCopiedSuccess());
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.link, size: 20),
                    label: Text(AppLocalizations.of(context).shareUrlButtonLabel),
                    onPressed: _isNotSupportedByOS
                        ? null
                        : () => BlocProvider.of<ShareBloc>(context).add(ShareUrlShared(palette)),
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
