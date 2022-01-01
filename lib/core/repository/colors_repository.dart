import 'dart:ui' show Color;

import 'package:flutter/foundation.dart' show debugPrint;

import '../../color_generator/models/colors/constants.dart';
import '../../color_generator/models/locks/locked_colors.dart';
import '../models/color_palette/color_palette.dart';

class ColorsRepository {
  final ColorPalette _colorPalette;
  final LockedColors _locked;
  final Future<ColorPalette> Function(ColorPalette palette, List<bool> lockedColors) _getNewColors;

  ColorPalette get palette => _colorPalette;
  List<bool> get lockedColors => _locked.list;

  ColorsRepository({
    required ColorPalette colorPalette,
    required LockedColors lockedColors,
    required Future<ColorPalette> Function(ColorPalette palette, List<bool> lockedColors) getNewColors,
  })  : _colorPalette = colorPalette,
        _getNewColors = getNewColors,
        _locked = lockedColors;

  void init() {
    for (final Color color in kDefaultColors) {
      _colorPalette.add(color);
      _locked.add(false);
    }
  }

  void changeColor(Color newColor, int colorIndex) => _colorPalette.change(colorIndex, newColor);

  void changeLock(int colorIndex) => _locked.change(colorIndex, true);

  void fromFavorites(ColorPalette palette) => _colorPalette.addAll(palette.colors);

  Future<bool> getNewColors() async {
    if (_locked.list.contains(false)) {
      try {
        final ColorPalette newColors = await _getNewColors(_colorPalette, _locked.list);
        final List<Color> filteredColors = _filterLockedColors(newColors);
        _colorPalette.addAll(filteredColors);

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
    // ! https://github.com/flutter/flutter/issues/24786 newIndex may be wrong :(
    if (oldIndex < newIndex) {
      // ignore: parameter_assignments
      newIndex -= 1;
    }
    final int colorsAvailable = kDefaultColors.length - 1;
    final int newIndexUngrowed = (newIndex > colorsAvailable) ? colorsAvailable : newIndex;
    _colorPalette.swap(oldIndex: oldIndex, newIndex: newIndexUngrowed);
    _locked.swap(oldIndex: oldIndex, newIndex: newIndexUngrowed);
  }

  void unlockAll() => _locked.unlockAll();

  List<Color> _filterLockedColors(ColorPalette newColors) {
    final List<Color> newColorsList = List<Color>.unmodifiable(newColors.colors);

    return List<Color>.generate(
      _locked.list.length,
      (int index) {
        final bool isLocked = _locked.list.elementAt(index);

        return isLocked ? _colorPalette.list.elementAt(index) : newColorsList.elementAt(index);
      },
      growable: false,
    );
  }
}
