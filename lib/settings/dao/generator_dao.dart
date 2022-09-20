import 'package:http/http.dart';

import '../../color_generator/interfaces/api.dart';
import '../../color_generator/services/api/colormind/colormind_api.dart';
import '../../color_generator/services/api/huemint/huemint_api.dart';
import '../../core/models/color_palette/color_palette.dart';
import '../mixins/colormind_settings.dart';
import '../mixins/huemint_settings.dart';
import '../models/selected_api.dart';

class GeneratorDAO with ColormindSettings, HuemintSettings {
  bool? isDarkTheme;
  SelectedAPI api;
  final Client? _httpClient;

  API<Object> get _selectedAPI {
    switch (api) {
      case SelectedAPI.huemint:
        return HuemintAPI(
          adjacency: huemintAdjacency,
          temperature: huemintTemperature,
          httpClient: _httpClient,
        );
      case SelectedAPI.colormind:
        return ColormindAPI(forUI: colormindForUI, httpClient: _httpClient);
    }
  }

  GeneratorDAO({
    this.isDarkTheme,
    this.api = SelectedAPI.colormind,
    Client? httpClient,
  }) : _httpClient = httpClient;

  Future<ColorPalette> fetchNewColors(
    ColorPalette palette,
    List<bool> lockedColors, {
    API<Object>? specificAPI,
  }) =>
      (specificAPI ?? _selectedAPI).fetchNewColors(palette, lockedColors);
}
