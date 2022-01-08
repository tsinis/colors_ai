import 'dart:ui';

import 'package:http/http.dart' show Client;

import '../../../../core/extensions/color_extensions.dart';
import '../../../../core/models/color_palette/color_palette.dart';
import '../../../../core/models/typedef_aliases/int_rgb_color.dart';
import '../../../interfaces/api.dart';
import '../../../models/colors/colors_providers/colormind/colormind_colors.dart';

class ColormindAPI extends API<IntRGBColor> {
  final String _defaultModelValue;
  final String _uiModelValue;
  final bool _forUI;

  const ColormindAPI({
    required bool forUI,
    String uiModelValue = 'ui',
    String defaultModelValue = 'default',
    Client? httpClient,
    String unlockedColorChar = 'N',
    String generateModelKey = 'model',
    String paletteInputKey = 'input',
  })  : _defaultModelValue = defaultModelValue,
        _uiModelValue = uiModelValue,
        _forUI = forUI,
        super(
          'http://colormind.io/api/',
          const ColormindColors(),
          unlockedColorChar: unlockedColorChar,
          generateModelKey: generateModelKey,
          paletteInputKey: paletteInputKey,
          httpClient: httpClient,
        );

  @override
  IntRGBColor apiColorTransformer(Color color) => color.toListInt();

  @override
  Future<ColorPalette> fetchNewColors(ColorPalette palette, List<bool> lockedColors) async {
    final List<bool> invertedLocks = lockedColors.map((bool isLocked) => !isLocked).toList(growable: false);

    final Map<String, Object> requestBody = <String, Object>{};

    final MapEntry<String, String> modelEntry = modelToInput(_forUI ? _uiModelValue : _defaultModelValue);
    final MapEntry<String, List<Object>> colorsEntry = colorsToInput(palette, invertedLocks);

    requestBody.addEntries(<MapEntry<String, Object>>[
      if (invertedLocks.contains(false)) colorsEntry,
      modelEntry,
    ]);

    return sendPostRequest(requestBody);
  }
}
