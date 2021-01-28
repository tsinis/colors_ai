import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/colors_share/share_bloc.dart';
import '../../../blocs/sounds_audio/sound_bloc.dart';
import '../../../repositories/colors_repository.dart';

class ShareColors extends StatelessWidget {
  const ShareColors();
  @override
  Widget build(BuildContext context) => BlocBuilder<ShareBloc, ShareState>(
        builder: (context, state) {
          if (state is ShareCurrentInitial) {
            final List<Color> currentColors = context.read<ColorsRepository>().listAsColors;
            return ListView(children: [
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
                    onPressed: currentColors.isEmpty
                        ? null
                        : () {
                            BlocProvider.of<SoundBloc>(context).add(const SoundCopied());
                            BlocProvider.of<ShareBloc>(context).add(ShareUrlCopied(currentColors));
                          },
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.link, size: 20),
                    label: const Text('SHARE URL'),
                    autofocus: true,
                    onPressed: currentColors.isEmpty
                        ? null
                        : () => BlocProvider.of<ShareBloc>(context).add(ShareUrlCShared(currentColors)),
                  ),
                ],
              )
            ]);
          } else {
            return Container(color: Colors.blue);
          }
        },
      );
}
