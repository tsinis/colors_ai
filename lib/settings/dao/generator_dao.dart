import '../../color_generator/interfaces/api.dart';
import '../../color_generator/services/api/colormind/colormind_api.dart';
import '../../core/models/color_palette/color_palette.dart';

class GeneratorDAO {
  bool colorsForUi;
  bool? isDarkTheme;
  API<Object> api;

  GeneratorDAO({this.colorsForUi = false, this.isDarkTheme, this.api = const ColormindAPI()});

  Future<ColorPalette> fetchNewColors(ColorPalette palette, List<bool> lockedColors) async =>
      api.fetchNewColors(palette, lockedColors: lockedColors, forUI: colorsForUi);
}
