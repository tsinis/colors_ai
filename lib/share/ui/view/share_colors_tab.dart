import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../general/blocs/snackbars/snackbars_bloc.dart';
import '../../../general/models/color_palette/color_palette.dart';
import '../../../general/repository/colors_repository.dart';
import '../../blocs/share/share_hydrated_bloc.dart';

class ShareColors extends StatelessWidget {
  const ShareColors();

  static const int _firstProvider = 0;

  @override
  Widget build(BuildContext context) => BlocBuilder<ShareBloc, ShareState>(
        builder: (_, state) {
          if (state is! ShareFailure) {
            final int selectedProviderIndex = state.selectedProvider ?? _firstProvider;
            final ColorPalette palette = context.read<ColorsRepository>().toPalette();
            final String? exportFormats = state.providersList[selectedProviderIndex].formats;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24, bottom: 8, top: 24),
                    child: DropdownButtonFormField<int>(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Theme.of(context).splashColor,
                          labelText: 'Share a link via:',
                          helperStyle:
                              const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black54),
                          helperMaxLines: 1,
                          helperText: (selectedProviderIndex == _firstProvider)
                              ? 'Arts that match your colors'
                              : (exportFormats != null)
                                  ? '* Export to: $exportFormats'
                                  : null),
                      value: selectedProviderIndex,
                      onChanged: (newProviderIndex) {
                        if (newProviderIndex != null) {
                          BlocProvider.of<ShareBloc>(context)
                              .add(ShareUrlProviderSelected(providerIndex: newProviderIndex));
                        }
                      },
                      items: List.generate(
                        state.providersList.length,
                        (int index) => DropdownMenuItem<int>(
                          value: index,
                          child: RichText(
                              text: TextSpan(
                                  style: const TextStyle(color: Colors.black),
                                  text: state.providersList[index].name,
                                  children: (state.providersList[index].formats != null)
                                      ? const [TextSpan(text: '*', style: TextStyle(color: Colors.grey))]
                                      : null)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ButtonBar(
                      mainAxisSize: MainAxisSize.max,
                      alignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        OutlinedButton.icon(
                          icon: const Icon(Icons.content_copy_outlined, size: 20),
                          label: const Text('COPY URL'),
                          onPressed: () {
                            BlocProvider.of<ShareBloc>(context).add(ShareUrlCopied(palette));
                            BlocProvider.of<SnackbarBloc>(context).add(const UrlCopiedSuccess());
                          },
                        ),
                        ElevatedButton.icon(
                          icon: const Icon(Icons.link, size: 20),
                          label: const Text('SHARE URL'),
                          autofocus: true,
                          onPressed: () => BlocProvider.of<ShareBloc>(context).add(ShareUrlShared(palette)),
                        ),
                      ],
                    ),
                  ),
                  AnimatedOpacity(
                    curve: Curves.easeInOutCubicEmphasized,
                    duration: const Duration(seconds: 2),
                    opacity: state is ShareSelectedInitial ? 1 : 0,
                    child: (state is ShareSelectedInitial && state.canSharePdf)
                        ? Column(
                            children: [
                              const Divider(),
                              RadioListTile<bool>(
                                  dense: true,
                                  title: RichText(
                                    text: const TextSpan(
                                      text: 'A4',
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' (210 by 297 millimetres)',
                                          style:
                                              TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                  subtitle: const Text('International ISO 216 Standard'),
                                  value: false,
                                  groupValue: state.isLetter ?? false,
                                  onChanged: (isLetterSelected) {
                                    if (isLetterSelected != null) {
                                      BlocProvider.of<ShareBloc>(context)
                                          .add(ShareFormatSelected(isLetter: isLetterSelected));
                                    }
                                  }),
                              RadioListTile<bool>(
                                  dense: true,
                                  title: RichText(
                                    text: const TextSpan(
                                      text: 'US Letter',
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' (8.5 by 11 inches)',
                                          style:
                                              TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                  subtitle: const Text('North American ANSI Standard'),
                                  value: true,
                                  groupValue: state.isLetter ?? false,
                                  onChanged: (isLetterSelected) {
                                    if (isLetterSelected != null) {
                                      BlocProvider.of<ShareBloc>(context)
                                          .add(ShareFormatSelected(isLetter: isLetterSelected));
                                    }
                                  }),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: ButtonBar(
                                  mainAxisSize: MainAxisSize.max,
                                  alignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    OutlinedButton.icon(
                                      icon: const Icon(Icons.image_outlined, size: 20),
                                      label: const Text('SHARE PNG'),
                                      onPressed: state.canSharePng
                                          ? () => BlocProvider.of<ShareBloc>(context).add(ShareImageShared(palette))
                                          : null,
                                    ),
                                    ElevatedButton.icon(
                                      icon: const Icon(Icons.picture_as_pdf_outlined, size: 20),
                                      label: const Text('SHARE PDF'),
                                      onPressed: () => BlocProvider.of<ShareBloc>(context).add(SharePdfShared(palette)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            );
          } else {
            BlocProvider.of<SnackbarBloc>(context).add(const ShareFail());
            return const Center(child: CircularProgressIndicator());
          }
        },
      );
}
