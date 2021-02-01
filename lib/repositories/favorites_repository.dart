import 'dart:ui' show Color;

import 'package:hive/hive.dart';

import '../models/colors/constants.dart';
import '../models/hive_adapters/color_adapter.dart';

class FavoritesRepository {
  const FavoritesRepository();

  static bool _boxInitialized = false;
  static const String _favoritesBox = 'favorite';
  static final List<List<Color>> _list = [];

  List<List<Color>> get list => _list;

  void add(List<Color> color) => _list.add(color);

  void remove(int colorIndex) {
    try {
      _list.removeAt(colorIndex);
      // ignore: avoid_catches_without_on_clauses
    } catch (_) {}
  }

  void get removeAll => _list.clear();

  Future<Box<Color>> get clearStorage async {
    final Box<Color> favoritesBox = await Hive.openBox<Color>(_favoritesBox);
    await favoritesBox.clear();
    return favoritesBox;
  }

  Future<void> get updateStorage async => clearStorage.then((favoritesBox) async {
        for (final List<Color> list in _list) {
          // ignore: avoid_function_literals_in_foreach_calls
          list.forEach((color) async {
            await favoritesBox.add(color);
          });
        }
      });

  Future<bool?> get loadStoredFavorites async {
    if (!_boxInitialized) {
      _boxInitialized = true;
      try {
        Hive.registerAdapter(ColorAdapter());
        final Box<Color> favoritesBox = await Hive.openBox<Color>(_favoritesBox);
        _joinColorsLists(favoritesBox.values.toList());
        return _list.isNotEmpty;
        // ignore: avoid_catches_without_on_clauses
      } catch (_) {
        return false;
      }
    }
  }

  void _joinColorsLists(List<Color> onlyColors) {
    _list.clear();
    final int len = onlyColors.length, size = defaultColors.length;
    for (var i = 0; i < len; i += size) {
      final int end = (i + size < len) ? i + size : len;
      _list.add(onlyColors.sublist(i, end));
    }
  }
}
