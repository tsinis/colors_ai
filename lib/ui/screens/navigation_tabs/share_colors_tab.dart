import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:mdi/mdi.dart';

import '../../../blocs/colors_share/share_bloc.dart';
import '../../../blocs/sounds_audio/sound_bloc.dart';
import '../../../repositories/colors_repository.dart';
// import '../../theme/theme.dart';

class ShareColors extends StatelessWidget {
  const ShareColors();
  @override
  Widget build(BuildContext context) => BlocBuilder<ShareBloc, ShareState>(builder: (context, state) {
        if (state is ShareCurrentInitial) {
          final List<Color> currentColors = context.read<ColorsRepository>().listAsColors;
          return ListView(children: [
            const Padding(padding: EdgeInsets.only(top: 20, left: 24, bottom: 8), child: Text('Share as:')),
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
      }
          // SingleChildScrollView(
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          // const Padding(padding: EdgeInsets.only(top: 24, left: 24, bottom: 12), child: Text('Colors to share')),
          // RadioListTile<ColorsToShare>(
          //   title: const Text('Current Colors'),
          //   secondary: const Padding(padding: EdgeInsets.only(right: 8), child: Icon(Icons.table_rows_outlined)),
          //   value: ColorsToShare.current,
          //   groupValue: _colorsToShare,
          //   onChanged: print,
          // ),
          // RadioListTile<ColorsToShare>(
          //   title: const Text('All Favorites'),
          //   secondary: const Padding(padding: EdgeInsets.only(right: 8), child: Icon(Icons.grid_on_outlined)),
          //   value: ColorsToShare.favorites,
          //   groupValue: _colorsToShare,
          //   onChanged: print,
          // ),
          // const Divider(),
          // const Padding(padding: EdgeInsets.only(top: 16, left: 24, bottom: 12), child: Text('Share as File')),
          // const RadioListTile<bool>(
          //   title: Text('JPG Picture'),
          //   secondary: Padding(padding: EdgeInsets.only(right: 8), child: Icon(Icons.image_outlined)),
          //   value: true,
          //   groupValue: true,
          //   onChanged: print,
          // ),
          // const RadioListTile<bool>(
          //   title: Text('PDF (Coming Soon)', style: TextStyle(color: Colors.grey)),
          //   secondary: Padding(padding: EdgeInsets.only(right: 8), child: Icon(Mdi.filePdfBoxOutline)),
          //   value: false,
          //   groupValue: true,
          //   onChanged: print,
          // ),
          // Center(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8),
          //     child: ElevatedButton.icon(
          //       style: appTheme.elevatedButtonTheme.style,
          //       icon: const Icon(Icons.description_outlined, size: 20),
          //       label: const Text('SHARE FILE'),
          //       onPressed: () => print('sharing file'),
          //     ),
          //   ),
          // ),
          // const ListTile(
          //   contentPadding: EdgeInsets.symmetric(horizontal: 40),
          //   trailing: Icon(Icons.announcement_outlined),
          //   title: Text('TIP: More formats available online.'),
          //   subtitle: Text('access via URL'),
          //   enableFeedback: false,
          // ),
          // const Divider(),
          // const Padding(padding: EdgeInsets.only(top: 16, left: 24, bottom: 12), child: Text('Share as URL')),
          // ListView.separated(
          //     separatorBuilder: (_, __) => const Divider(height: 1.2),
          //     itemCount: 5,
          //     itemBuilder: (context, listIndex) => Text(listIndex.toString())),
          //       ButtonBar(
          //         alignment: MainAxisAlignment.center,
          //         buttonMinWidth: 200,
          //         children: <Widget>[
          //           OutlinedButton.icon(
          //             icon: const Icon(Icons.content_copy_outlined, size: 20),
          //             label: const Text('COPY URL'),
          //             onPressed: () {
          //               BlocProvider.of<SoundBloc>(context).add(const SoundCopied());
          //               BlocProvider.of<ShareBloc>(context).add(ShareUrlCopied());
          //             },
          //           ),
          //           ElevatedButton.icon(
          //             icon: const Icon(Icons.link, size: 20),
          //             label: const Text('SHARE URL'),
          //             onPressed: () => BlocProvider.of<ShareBloc>(context).add(ShareUrlCShared()),
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // );

// enum ColorsToShare { current, favorites }
// ColorsToShare _colorsToShare = ColorsToShare.current;

// enum FileFormat { jpg, pdf }
// FileFormat _format = FileFormat.jpg;
          );
}
