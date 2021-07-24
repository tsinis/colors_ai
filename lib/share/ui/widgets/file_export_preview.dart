import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/color_palette/color_palette.dart';
import '../../blocs/share/share_hydrated_bloc.dart';
import '../../services/export/file_export.dart';

class FileExportPreview extends StatefulWidget {
  const FileExportPreview(this._palette);
  final ColorPalette _palette;

  @override
  State<FileExportPreview> createState() => _FileExportPreviewState();
}

class _FileExportPreviewState extends State<FileExportPreview> {
  bool isHovering = false;
  static const Duration duration = Duration(milliseconds: 600);
  static const Curve curve = Curves.easeInOutCubicEmphasized;

  @override
  Widget build(BuildContext context) => BlocBuilder<ShareBloc, ShareState>(
      builder: (_, state) => MouseRegion(
            onEnter: (_) => setState(() => isHovering = true),
            onExit: (_) => setState(() => isHovering = false),
            child: GestureDetector(
              onTap: () => setState(() => isHovering = !isHovering),
              child: AnimatedPhysicalModel(
                duration: const Duration(seconds: 1),
                curve: Curves.decelerate,
                color: isHovering ? Colors.white : Colors.grey[200]!,
                borderRadius: BorderRadius.circular(isHovering ? 2 : 8),
                clipBehavior: Clip.hardEdge,
                elevation: isHovering ? 10 : 2,
                shadowColor: Colors.black26,
                shape: BoxShape.rectangle,
                child: AnimatedSize(
                  duration: duration,
                  curve: curve,
                  child: AspectRatio(
                    aspectRatio: (state.isLetter == true) ? 110 / 85 : 297 / 210,
                    child: FractionallySizedBox(
                      widthFactor: 0.9,
                      heightFactor: 0.9,
                      child: AnimatedSize(
                        duration: duration,
                        curve: curve,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            widget._palette.colors.length,
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
                                        padding: const EdgeInsets.all(2),
                                        child: AnimatedContainer(
                                            duration: duration,
                                            curve: curve,
                                            color: widget._palette.colors.elementAt(colorsIndex)),
                                      ),
                                    ),
                                  ),
                                  const Expanded(child: SizedBox()),
                                  Flexible(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: ListView.separated(
                                        itemCount: FileLayout.colorSpaces.length,
                                        separatorBuilder: (_, __) => AnimatedContainer(
                                            duration: duration, curve: curve, height: 2, color: Colors.transparent),
                                        itemBuilder: (_, __) => AnimatedContainer(
                                            duration: duration, curve: curve, height: 6, color: Colors.black12),
                                      ),
                                    ),
                                  ),
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
          ));
}
