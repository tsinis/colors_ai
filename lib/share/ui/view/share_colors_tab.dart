import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/theme/constants.dart';
import '../../../common/blocs/snackbars/snackbar_bloc.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/models/color_palette/color_palette.dart';
import '../../../core/repository/colors_repository.dart';
import '../../blocs/share_bloc.dart';
import '../../models/file_format.dart';
import '../../services/url_providers/colors_url_provider.dart';
import '../widgets/file_export_preview.dart';
import '../widgets/share_sections/file_share_section.dart';
import '../widgets/share_sections/url_share_section.dart';

class ShareColorsTab extends StatelessWidget {
  const ShareColorsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<ShareBloc, ShareState>(
        builder: (_, ShareState state) {
          if (state is ShareFailure) {
            BlocProvider.of<SnackbarBloc>(context).add(const ShareFail());
          }
          final ColorsUrlProvider selectedProvider = state.selectedProvider ?? state.providersList.first;
          final FileFormat selectedFormat = state.selectedFormat ?? FileFormat.values.first;
          final ColorPalette palette = context.read<ColorsRepository>().palette;
          final String? exportFormats = selectedProvider.formats;
          final bool isPortrait = context.media.orientation == Orientation.portrait;

          return LayoutBuilder(
            builder: (_, BoxConstraints size) => isPortrait
                ? ListView(
                    children: <Widget>[
                      UrlShareSection(
                        palette,
                        width: size.maxWidth,
                        selectedUrlProvider: selectedProvider,
                        exportFormats: exportFormats,
                        providersList: state.providersList,
                      ),
                      AnimatedOpacity(
                        curve: kDefaultTransitionCurve,
                        duration: kDefaultLongTransitionDuration,
                        opacity: state is ShareSelectedInitial ? 1 : 0,
                        child: (state is ShareSelectedInitial && state.canSharePdf)
                            ? FileShareSection(
                                palette,
                                width: size.maxWidth,
                                canSharePng: state.canSharePng,
                                canSharePdf: state.canSharePdf,
                                selectedFormat: selectedFormat,
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
                      const SizedBox(height: 16),
                    ],
                  )
                : SingleChildScrollView(
                    child: SizedBox(
                      height: size.maxHeight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              AnimatedOpacity(
                                curve: kDefaultTransitionCurve,
                                duration: kDefaultLongTransitionDuration,
                                opacity: state is ShareSelectedInitial ? 1 : 0,
                                child: (state is ShareSelectedInitial && state.canSharePdf)
                                    ? FileShareSection(
                                        palette,
                                        width: size.maxWidth,
                                        canSharePng: state.canSharePng,
                                        canSharePdf: state.canSharePdf,
                                        selectedFormat: selectedFormat,
                                      )
                                    : const SizedBox.shrink(),
                              ),
                              SizedBox(height: size.maxHeight / 6, child: const VerticalDivider(color: Colors.grey)),
                              UrlShareSection(
                                palette,
                                width: size.maxWidth,
                                selectedUrlProvider: selectedProvider,
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
