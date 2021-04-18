import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/colors_share/share_bloc.dart';
import '../../../models/hive/color_palette.dart';
import '../../../repositories/colors_repository.dart';

class ShareColors extends StatelessWidget {
  const ShareColors();

  @override
  Widget build(BuildContext context) => BlocBuilder<ShareBloc, ShareState>(
        builder: (_, state) {
          if (state is ShareCurrentInitial) {
            final ColorPalette palette = context.read<ColorsRepository>().asPalette;
            return ListView(
              children: [
                const Padding(padding: EdgeInsets.only(top: 20, left: 24, bottom: 8), child: Text('Share a link as:')),
                ...List.generate(
                  state.providersList.length,
                  (int index) => RadioListTile(
                    title: Text(state.providersList[index].providerName),
                    subtitle: Text((state.providersList[index].formats.isEmpty)
                        ? 'Arts that match your colors'
                        : 'Export to: ${state.providersList[index].formats}'),
                    value: index,
                    groupValue: state.selectedProvider,
                    onChanged: (newProviderIndex) {
                      if (newProviderIndex is int) {
                        BlocProvider.of<ShareBloc>(context).add(ShareUrlProviderChanged(newProviderIndex));
                      }
                    },
                  ),
                ),
                ButtonBar(
                  mainAxisSize: MainAxisSize.max,
                  alignment: MainAxisAlignment.center,
                  buttonMinWidth: 200,
                  children: <Widget>[
                    OutlinedButton.icon(
                      icon: const Icon(Icons.content_copy_outlined, size: 20),
                      label: const Text('COPY URL'),
                      onPressed: palette.colors.isEmpty
                          ? null
                          : () => BlocProvider.of<ShareBloc>(context).add(ShareUrlCopied(palette)),
                    ),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.link, size: 20),
                      label: const Text('SHARE URL'),
                      autofocus: true,
                      onPressed: palette.colors.isEmpty
                          ? null
                          : () => BlocProvider.of<ShareBloc>(context).add(ShareUrlShared(palette)),
                    ),
                  ],
                )
              ],
            );
          } else {
            return Container(color: Colors.blue);
          }
        },
      );
}
