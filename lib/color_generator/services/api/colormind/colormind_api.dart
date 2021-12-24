import 'dart:ui';

import '../../../../core/extensions/color_extensions.dart';
import '../../../../core/models/color_palette/color_palette.dart';
import '../../../../core/models/typedef_aliases/int_rgb_color.dart';
import '../../../interfaces/api.dart';
import '../../../models/colors/colors_providers/colormind/colormind_colors.dart';

class ColormindAPI extends API<IntRGBColor> {
  final String defaultModelValue;
  final String uiModelValue;
  final bool forUI;

  const ColormindAPI({
    required this.forUI,
    this.uiModelValue = 'ui',
    this.defaultModelValue = 'default',
  }) : super(
          'http://colormind.io/api/',
          const ColormindColors(),
          unlockedColorChar: 'N',
          generateModelKey: 'model',
          paletteInputKey: 'input',
        );

  @override
  IntRGBColor apiColorTransformer(Color color) => color.toListInt();

  @override
  Future<ColorPalette> fetchNewColors(ColorPalette palette, List<bool> lockedColors) async {
    final List<bool> invertedLocks = lockedColors.map((bool isLocked) => !isLocked).toList(growable: false);

    final Map<String, Object> requestBody = <String, Object>{};

    final MapEntry<String, String> modelEntry = modelToInput(forUI ? uiModelValue : defaultModelValue);
    final MapEntry<String, List<Object>> colorsEntry = colorsToInput(palette, invertedLocks);

    requestBody.addEntries(<MapEntry<String, Object>>[
      if (invertedLocks.contains(false)) colorsEntry,
      modelEntry,
    ]);

    return sendPostRequest(requestBody);
  }
}
