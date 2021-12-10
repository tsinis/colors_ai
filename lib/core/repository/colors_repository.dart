import 'dart:ui' show Color;

import 'package:flutter/foundation.dart' show debugPrint;

import '../../color_generator/interfaces/api.dart';
import '../../color_generator/interfaces/colors_from_api.dart';
import '../../color_generator/models/colors/constants.dart';
import '../../color_generator/models/locks/locked_colors.dart';
import '../../color_generator/services/api/colormind/colormind_api.dart';
import '../extensions/color_palette_extension.dart';
import '../models/color_palette/color_palette.dart';

class ColorsRepository {
  final API apiService;
  final ColorsFromAPI _apiColors;
  final LockedColors _locked;

  ColorPalette get palette => _apiColors.list.toPalette();
  List<bool> get lockedColors => _locked.list;

  ColorsRepository({
    required ColorsFromAPI colorsFromAPI,
    required LockedColors lockedColors,
    this.apiService = const ColormindAPI(),
  })  : _apiColors = colorsFromAPI,
        _locked = lockedColors;

  void init() {
    for (final Color color in kDefaultColors) {
      _apiColors.add(color);
      _locked.add();
    }
  }

  void changeColor(Color newColor, int colorIndex) => _apiColors.change(colorIndex, newColor);

  void changeLock(int colorIndex) => _locked.change(colorIndex);

  void fromFavorites(ColorPalette palette) => _apiColors.fromPalette(palette);

  Future<bool> getNewColors({required bool forUI}) async {
    if (_locked.list.contains(false)) {
      try {
        final newColors = await apiService.fetchNewColors(
          _apiColors.toPalette(),
          lockedColors: _locked.list,
          forUI: forUI,
        );
        final filteredColors = _filterLockedColors(newColors);
        _apiColors.addAll(filteredColors);

        return true;
      } on Exception catch (e) {
        debugPrint(e.toString());

        return false;
      }
    } else {
      return true;
    }
  }

  void lock(int colorIndex) => _locked.lock(colorIndex);

  void swapColors({required int oldIndex, required int newIndex}) {
    // https://github.com/flutter/flutter/issues/24786 newIndex may be wrong :(
    // ignore: parameter_assignments, always_put_control_body_on_new_line
    if (oldIndex < newIndex) newIndex -= 1;
    final int colorsAvailble = kDefaultColors.length - 1;
    final int newIndexUngrowed = (newIndex > colorsAvailble) ? colorsAvailble : newIndex;
    _apiColors.swap(oldIndex: oldIndex, newIndex: newIndexUngrowed);
    _locked.swap(oldIndex: oldIndex, newIndex: newIndexUngrowed);
  }

  ColorPalette toPalette() => _apiColors.toPalette();

  void unlockAll() => _locked.unlockAll();

  List<Color> _filterLockedColors(ColorPalette newColors) {
    final List<Color> newColorsList = List<Color>.unmodifiable(newColors.colors);
    return List<Color>.generate(
      _locked.list.length,
      (int index) {
        final bool isLocked = _locked.list.elementAt(index);
        return isLocked ? _apiColors.list.elementAt(index) : newColorsList.elementAt(index);
      },
      growable: false,
    );
  }
}
