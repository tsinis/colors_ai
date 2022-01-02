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

  API<Object> get _selectedApi {
    switch (api) {
      case SelectedAPI.huemint:
        return HuemintAPI(adjacency: huemintAdjacency, temperature: huemintTemperature);
      case SelectedAPI.colormind:
        return ColormindAPI(forUI: colormindForUI);
    }
  }

  GeneratorDAO({this.isDarkTheme, this.api = SelectedAPI.colormind});

  Future<ColorPalette> fetchNewColors(ColorPalette palette, List<bool> lockedColors) async =>
      _selectedApi.fetchNewColors(palette, lockedColors);
}
