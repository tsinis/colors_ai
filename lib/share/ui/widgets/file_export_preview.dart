import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app/theme/constants.dart';
import '../../../common/blocs/snackbars/snackbar_bloc.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/models/color_palette/color_palette.dart';
import '../../blocs/share_bloc.dart';
import '../../extensions/file_format_extension.dart';
import '../../mixins/text_based_file_creator.dart';
import '../../models/color_space.dart';
import '../../models/file_format.dart';

class FileExportPreview extends StatefulWidget {
  final Curve curve;
  final Duration duration;

  final ColorPalette _palette;

  const FileExportPreview(
    this._palette, {
    this.duration = const Duration(milliseconds: 600),
    this.curve = kDefaultTransitionCurve,
    super.key,
  });

  @override
  State<FileExportPreview> createState() => _FileExportPreviewState();
}

class _FileExportPreviewState extends State<FileExportPreview> with TextBasedFileCreator {
  bool isHovering = false;

  List<Color> get colors => widget._palette.colors;

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
      case FileFormat.svg:
        return colors.length.toDouble();
    }
  }

  Color fileBackgroundColor({required bool isPrintable}) {
    if (isPrintable) {
      return isHovering ? Colors.white : Colors.grey.shade200;
    } else {
      final bool isDark = context.theme.brightness == Brightness.dark;

      return isHovering
          ? (isDark ? Colors.grey.shade800 : Colors.grey.shade100)
          : (isDark ? Colors.grey.shade900 : Colors.grey.shade300);
    }
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<ShareBloc, ShareState>(
        builder: (_, ShareState state) {
          final FileFormat? selectedFormat = state.whenOrNull<FileFormat?>(
            formatSelected: (_, FileFormat? format, __, ___) => format,
          );
          final FileFormat file = selectedFormat ?? FileFormat.values.first;

          return GestureDetector(
            onTap: () {
              setState(() => isHovering = !isHovering);
              if (!file.isPrintable) {
                BlocProvider.of<ShareBloc>(context).add(ShareEvent.fileCopied(widget._palette));
                BlocProvider.of<SnackbarBloc>(context).add(SnackbarEvent.fileCopied(file.format));
              }
            },
            child: MouseRegion(
              onEnter: (_) => setState(() => isHovering = true),
              onExit: (_) => setState(() => isHovering = false),
              cursor: file.isPrintable ? MouseCursor.defer : SystemMouseCursors.click,
              child: AnimatedPhysicalModel(
                duration: kDefaultLongTransitionDuration,
                curve: Curves.decelerate,
                color: fileBackgroundColor(isPrintable: file.isPrintable),
                borderRadius: BorderRadius.circular(isHovering ? 2 : 8),
                clipBehavior: Clip.hardEdge,
                elevation: isHovering ? 10 : 2,
                shadowColor: Colors.black26,
                shape: BoxShape.rectangle,
                child: AnimatedSize(
                  duration: widget.duration,
                  curve: widget.curve,
                  child: AspectRatio(
                    aspectRatio: aspectRatio(file),
                    child: FractionallySizedBox(
                      widthFactor: 0.9,
                      heightFactor: 0.9,
                      child: AnimatedSize(
                        duration: widget.duration,
                        curve: widget.curve,
                        child: file == FileFormat.scss || file == FileFormat.json
                            ? FractionallySizedBox(
                                widthFactor: 0.6,
                                heightFactor: 0.6,
                                child: FittedBox(
                                  child: Center(
                                    child: AnimatedSwitcher(
                                      duration: kDefaultReverseTransitionDuration,
                                      switchInCurve: widget.curve,
                                      switchOutCurve: widget.curve,
                                      transitionBuilder: (Widget child, Animation<double> animation) => SizeTransition(
                                        sizeFactor: animation,
                                        axis: Axis.horizontal,
                                        axisAlignment: -1,
                                        child: child,
                                      ),
                                      child: Text(
                                        file == FileFormat.json ? toJson(widget._palette) : toScss(widget._palette),
                                        key: ValueKey<bool>(file == FileFormat.json),
                                        style: GoogleFonts.robotoMono(),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: List<Widget>.generate(
                                  colors.length,
                                  (int colorsIndex) => Flexible(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 12,
                                          child: AnimatedSize(
                                            duration: widget.duration,
                                            curve: widget.curve,
                                            child: AnimatedContainer(
                                              margin: EdgeInsets.all(file.isPrintable ? 2 : 0),
                                              duration: widget.duration,
                                              curve: widget.curve,
                                              color: colors.elementAt(colorsIndex),
                                            ),
                                          ),
                                        ),
                                        if (file.isPrintable) ...<Widget>[
                                          const Expanded(child: SizedBox()),
                                          Flexible(
                                            flex: 2,
                                            child: Padding(
                                              padding: const EdgeInsets.all(4),
                                              child: ListView.separated(
                                                itemCount: ColorSpace.values.length,
                                                separatorBuilder: (_, __) => AnimatedContainer(
                                                  duration: widget.duration,
                                                  curve: widget.curve,
                                                  height: 2,
                                                  color: Colors.transparent,
                                                ),
                                                itemBuilder: (_, __) => AnimatedContainer(
                                                  duration: widget.duration,
                                                  curve: widget.curve,
                                                  height: 6,
                                                  color: Colors.black12,
                                                ),
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
