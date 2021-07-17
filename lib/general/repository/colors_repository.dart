import 'dart:ui' show Color;

import 'package:flutter/foundation.dart' show debugPrint;

import '../../color_generator/models/colors/colors_json.dart';
import '../../color_generator/models/colors/constants.dart';
import '../../color_generator/models/locks/locked_colors.dart';
import '../../color_generator/services/api/api.dart';
import '../extensions/color.dart';
import '../models/color_palette/color_palette.dart';
import '../models/typedef_aliases/int_rgb_color.dart';

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
    // https://github.com/flutter/flutter/issues/24786 newIndex may be wrong :(
    // ignore: parameter_assignments, always_put_control_body_on_new_line
    if (oldIndex < newIndex) newIndex -= 1;
    final int colorsAvailble = defaultColors.length - 1;
    final int newIndexUngrowed = (newIndex > colorsAvailble) ? colorsAvailble : newIndex;
    _colorsAI.swap(oldIndex: oldIndex, newIndex: newIndexUngrowed);
    _locked.swap(oldIndex: oldIndex, newIndex: newIndexUngrowed);
  }

  ColorPalette toPalette() => _colorsAI.toPalette();

  void fromFavorites(ColorPalette palette) => _colorsAI.fromPalette(palette);

  Future<bool> get getNewColors async {
    if (_locked.list.contains(false)) {
      try {
        final newColors = await _apiServices.getNewColors(
          _colorsAI,
          lockedColors: _locked.list,
        );
        final filteredColors = _filterLockedColors(newColors);
        _colorsAI.addAll(filteredColors);
        return true;
      } on Exception catch (e) {
        debugPrint(e.toString());
        return false;
      }
    } else {
      return true;
    }
  }

  List<IntRGBColor> _filterLockedColors(ColorsAI newColors) {
    final List<IntRGBColor> newColorsList = List<IntRGBColor>.from(newColors.list, growable: false);
    final Map<int, bool> _lockedMap = _locked.list.asMap();
    final List<IntRGBColor> filteredColors = [];
    _lockedMap.forEach((index, isLocked) =>
        filteredColors.add(isLocked ? _colorsAI.list.elementAt(index) : newColorsList.elementAt(index)));
    return filteredColors;
  }
}
