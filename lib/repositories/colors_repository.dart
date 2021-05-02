import 'dart:ui' show Color;

import '../extensions/color_to_list_int.dart';
import '../models/colors/colors_json.dart';
import '../models/colors/constants.dart';
import '../models/hive/color_palette.dart';
import '../models/locks/locked_colors.dart';
import '../services/api/api.dart';

class ColorsRepository {
  ColorsRepository() {
    for (final Color color in defaultColors) {
      _colorsAI.add(color.toListInt());
      _locked.add();
    }
  }

  static const API _apiServices = API();

  final ColorsAI _colorsAI = ColorsAI(list: []);
  final LockedColors _locked = LockedColors(list: []);

  List<bool> get lockedColors => _locked.list;
  void unlockAll() => _locked.unlockAll();
  void changeLock(int colorIndex) => _locked.change(colorIndex);
  void lock(int colorIndex) => _locked.lock(colorIndex);

  ColorsAI get colors => _colorsAI;

  void changeColor(Color newColor, int colorIndex) => _colorsAI.change(colorIndex, newColor);

  void swapColors({required int oldIndex, required int newIndex}) {
    final int colorsAvailble = defaultColors.length - 1;
    // List can be temporary growable, in some cases, for example on long drag at the last tile.
    final int newIndexUngrowed = (newIndex > colorsAvailble) ? colorsAvailble : newIndex;
    _colorsAI.swap(oldIndex: oldIndex, newIndex: newIndexUngrowed);
    _locked.swap(oldIndex: oldIndex, newIndex: newIndexUngrowed);
  }

  ColorPalette get asPalette => _colorsAI.asPalette;

  void fromFavorites(ColorPalette palette) => _colorsAI.fromPalette(palette);

  Future<bool> get getNewColors async {
    if (_locked.list.contains(false)) {
      try {
        final newColors = await _apiServices.getNewColors(
          _colorsAI,
          lockedColors: _locked.list,
        );
        _colorsAI.addAll(newColors.list);
        return true;
      } on Exception catch (_) {
        return false;
      }
    } else {
      return true;
    }
  }
}
