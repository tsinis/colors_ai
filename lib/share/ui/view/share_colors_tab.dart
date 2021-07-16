import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../general/blocs/snackbars/snackbars_bloc.dart';
import '../../../general/models/color_palette/color_palette.dart';
import '../../../general/repository/colors_repository.dart';
import '../../../general/ui/widgets/helpers/orientation_switcher.dart';
import '../../blocs/share/share_hydrated_bloc.dart';
import '../widgets/file_export_preview.dart';
import '../widgets/share_sections/file_share_section.dart';
import '../widgets/share_sections/url_share_section.dart';

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
            final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
            return LayoutBuilder(
              builder: (_, size) => SingleChildScrollView(
                child: SizedBox(
                  height: size.maxHeight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!isPortrait) const SizedBox(height: 16),
                      OrientationSwitcher(
                        mainAxisAlignment: isPortrait ? MainAxisAlignment.spaceAround : MainAxisAlignment.spaceAround,
                        isPortrait: isPortrait,
                        children: [
                          if (isPortrait)
                            UrlShareSection(
                              palette,
                              width: size.maxWidth,
                              selectedProviderIndex: selectedProviderIndex,
                              firstProvider: _firstProvider,
                              exportFormats: exportFormats,
                              providersList: state.providersList,
                            ),
                          AnimatedOpacity(
                            curve: Curves.easeInOutCubicEmphasized,
                            duration: const Duration(seconds: 1),
                            opacity: state is ShareSelectedInitial ? 1 : 0,
                            child: (state is ShareSelectedInitial && state.canSharePdf)
                                ? FileShareSection(
                                    palette,
                                    width: size.maxWidth,
                                    isLetter: state.isLetter,
                                    canSharePng: state.canSharePdf,
                                  )
                                : const SizedBox.shrink(),
                          ),
                          if (!isPortrait)
                            UrlShareSection(
                              palette,
                              width: size.maxWidth,
                              selectedProviderIndex: selectedProviderIndex,
                              firstProvider: _firstProvider,
                              exportFormats: exportFormats,
                              providersList: state.providersList,
                            ),
                        ],
                      ),
                      Flexible(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxHeight: size.maxHeight * 0.6, maxWidth: size.maxWidth * 0.8),
                              child: FileExportPreview(palette),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            BlocProvider.of<SnackbarBloc>(context).add(const ShareFail());
            return const Center(child: CircularProgressIndicator());
          }
        },
      );
}
