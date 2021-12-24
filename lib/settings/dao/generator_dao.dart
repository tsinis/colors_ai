import 'package:flutter/foundation.dart' show visibleForTesting;

import '../../color_generator/interfaces/api.dart';
import '../../color_generator/services/api/colormind/colormind_api.dart';
import '../../color_generator/services/api/huemint/huemint_api.dart';
import '../../core/models/color_palette/color_palette.dart';
import '../models/selected_api.dart';

class GeneratorDAO {
  bool colorsForUi;
  bool? isDarkTheme;
  SelectedAPI api;

  @visibleForTesting
  API<Object> get selectedApi {
    switch (api) {
      case SelectedAPI.huemint:
        return const HuemintAPI(adjacency: 36, temperature: 1.2);
      case SelectedAPI.colormind:
        return ColormindAPI(forUI: colorsForUi);
    }
  }

  GeneratorDAO({this.colorsForUi = false, this.isDarkTheme, this.api = SelectedAPI.colormind});

  Future<ColorPalette> fetchNewColors(ColorPalette palette, List<bool> lockedColors) async =>
      selectedApi.fetchNewColors(palette, lockedColors);
}
