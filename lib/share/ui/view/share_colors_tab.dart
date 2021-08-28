import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/blocs/snackbars/snackbars_bloc.dart';
import '../../../core/models/color_palette/color_palette.dart';
import '../../../core/repository/colors_repository.dart';
import '../../blocs/share/share_hydrated_bloc.dart';
import '../widgets/file_export_preview.dart';
import '../widgets/share_sections/file_share_section.dart';
import '../widgets/share_sections/url_share_section.dart';

class ShareColors extends StatelessWidget {
  const ShareColors();

  static const int _first = 0;

  @override
  Widget build(BuildContext context) => BlocBuilder<ShareBloc, ShareState>(
        builder: (_, state) {
          if (state is ShareFailure) {
            BlocProvider.of<SnackbarBloc>(context).add(const ShareFail());
          }
          final int selectedProviderIndex = state.selectedProvider ?? _first;
          final int selectedFormatIndex = state.selectedFormat ?? _first;
          final ColorPalette palette = context.read<ColorsRepository>().toPalette();
          final String? exportFormats = state.providersList[selectedProviderIndex].formats;
          final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
          return LayoutBuilder(
            builder: (_, size) => isPortrait
                ? ListView(
                    children: [
                      UrlShareSection(
                        palette,
                        width: size.maxWidth,
                        selectedProviderIndex: selectedProviderIndex,
                        firstProvider: _first,
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
                                canSharePng: state.canSharePng,
                                canSharePdf: state.canSharePdf,
                                firstFormat: _first,
                                selectedFormatIndex: selectedFormatIndex,
                              )
                            : const SizedBox.shrink(),
                      ),
                      FractionallySizedBox(
                        widthFactor: 0.92,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: size.maxHeight * 0.6, maxWidth: size.maxWidth * 0.8),
                          child: FileExportPreview(palette),
                        ),
                      ),
                      const SizedBox(height: 16)
                    ],
                  )
                : SingleChildScrollView(
                    child: SizedBox(
                      height: size.maxHeight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AnimatedOpacity(
                                curve: Curves.easeInOutCubicEmphasized,
                                duration: const Duration(seconds: 1),
                                opacity: state is ShareSelectedInitial ? 1 : 0,
                                child: (state is ShareSelectedInitial && state.canSharePdf)
                                    ? FileShareSection(
                                        palette,
                                        width: size.maxWidth,
                                        canSharePng: state.canSharePng,
                                        canSharePdf: state.canSharePdf,
                                        firstFormat: _first,
                                        selectedFormatIndex: selectedFormatIndex,
                                      )
                                    : const SizedBox.shrink(),
                              ),
                              SizedBox(height: size.maxHeight / 6, child: const VerticalDivider(color: Colors.grey)),
                              UrlShareSection(
                                palette,
                                width: size.maxWidth,
                                selectedProviderIndex: selectedProviderIndex,
                                firstProvider: _first,
                                exportFormats: exportFormats,
                                providersList: state.providersList,
                              ),
                            ],
                          ),
                          Flexible(
                            child: Center(
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
        },
      );
}
