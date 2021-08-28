import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/blocs/snackbars/snackbars_bloc.dart';
import '../../../core/models/color_palette/color_palette.dart';
import '../../blocs/share/share_hydrated_bloc.dart';
import '../../mixins/text_based_file_creator.dart';
import '../../models/file_format_enum.dart';
import '../../services/export/file_export.dart';

class FileExportPreview extends StatefulWidget {
  const FileExportPreview(this._palette);
  final ColorPalette _palette;

  @override
  State<FileExportPreview> createState() => _FileExportPreviewState();
}

class _FileExportPreviewState extends State<FileExportPreview> with TextBasedFileCreator {
  bool isHovering = false;
  static const Duration duration = Duration(milliseconds: 600);
  static const Curve curve = Curves.easeInOutCubicEmphasized;

  double aspectRatio(FileFormat selectedFormat) {
    switch (selectedFormat) {
      case FileFormat.pdfLetter:
      case FileFormat.pngLetter:
        return 110 / 85;
      case FileFormat.pdfA4:
      case FileFormat.pngA4:
        return 297 / 210;
      case FileFormat.scss:
      case FileFormat.json:
        return 1;
      default:
        return colors.length.toDouble();
    }
  }

  List<Color> get colors => widget._palette.colors;

  Color fileBackgroundColor({required bool isPrintable}) {
    if (isPrintable) {
      return isHovering ? Colors.white : Colors.grey[200]!;
    } else {
      final bool isDark = Theme.of(context).brightness == Brightness.dark;
      return isHovering
          ? (isDark ? Colors.grey[800]! : Colors.grey[100]!)
          : (isDark ? Colors.grey[900]! : Colors.grey[300]!);
    }
  }

  Text codeText({required bool isJson}) => Text(isJson ? toJson(widget._palette) : toScss(widget._palette),
      key: ValueKey<bool>(isJson), style: GoogleFonts.robotoMono());

  @override
  Widget build(BuildContext context) => BlocBuilder<ShareBloc, ShareState>(
        builder: (_, state) {
          final FileFormat file = state.selectedFormat.selectedFile;
          final bool isPrintable = (state.selectedFormat ?? 0) < 4, isJson = file == FileFormat.json;
          return GestureDetector(
            onTap: () {
              setState(() => isHovering = !isHovering);
              if (!isPrintable) {
                BlocProvider.of<ShareBloc>(context).add(ShareFileCopied(widget._palette));
                BlocProvider.of<SnackbarBloc>(context).add(FileCopiedSuccess(file.format));
              }
            },
            child: MouseRegion(
              onEnter: (_) => setState(() => isHovering = true),
              onExit: (_) => setState(() => isHovering = false),
              cursor: isPrintable ? MouseCursor.defer : SystemMouseCursors.click,
              child: AnimatedPhysicalModel(
                duration: const Duration(seconds: 1),
                curve: Curves.decelerate,
                color: fileBackgroundColor(isPrintable: isPrintable),
                borderRadius: BorderRadius.circular(isHovering ? 2 : 8),
                clipBehavior: Clip.hardEdge,
                elevation: isHovering ? 10 : 2,
                shadowColor: Colors.black26,
                shape: BoxShape.rectangle,
                child: AnimatedSize(
                  duration: duration,
                  curve: curve,
                  child: AspectRatio(
                    aspectRatio: aspectRatio(file),
                    child: FractionallySizedBox(
                      widthFactor: 0.9,
                      heightFactor: 0.9,
                      child: AnimatedSize(
                        duration: duration,
                        curve: curve,
                        child: (file == FileFormat.scss || file == FileFormat.json)
                            ? FractionallySizedBox(
                                widthFactor: 0.6,
                                heightFactor: 0.6,
                                child: FittedBox(
                                  child: Center(
                                    child: AnimatedSwitcher(
                                      duration: const Duration(milliseconds: 200),
                                      switchInCurve: curve,
                                      switchOutCurve: curve,
                                      transitionBuilder: (Widget child, Animation<double> animation) => SizeTransition(
                                        sizeFactor: animation,
                                        axis: Axis.horizontal,
                                        axisAlignment: -1,
                                        child: child,
                                      ),
                                      child: codeText(isJson: isJson),
                                    ),
                                  ),
                                ),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                  colors.length,
                                  (colorsIndex) => Flexible(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          flex: 12,
                                          child: AnimatedSize(
                                            duration: duration,
                                            curve: curve,
                                            child: Padding(
                                              padding: EdgeInsets.all(isPrintable ? 2 : 0),
                                              child: AnimatedContainer(
                                                  duration: duration,
                                                  curve: curve,
                                                  color: colors.elementAt(colorsIndex)),
                                            ),
                                          ),
                                        ),
                                        if (isPrintable) ...[
                                          const Expanded(child: SizedBox()),
                                          Flexible(
                                            flex: 2,
                                            child: Padding(
                                              padding: const EdgeInsets.all(4),
                                              child: ListView.separated(
                                                itemCount: FileLayout.colorSpaces.length,
                                                separatorBuilder: (_, __) => AnimatedContainer(
                                                    duration: duration,
                                                    curve: curve,
                                                    height: 2,
                                                    color: Colors.transparent),
                                                itemBuilder: (_, __) => AnimatedContainer(
                                                    duration: duration, curve: curve, height: 6, color: Colors.black12),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                  growable: false,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
}
