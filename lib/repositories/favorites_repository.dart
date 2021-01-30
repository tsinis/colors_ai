import 'dart:ui' show Color;

// ignore: import_of_legacy_library_into_null_safe
import 'package:hive/hive.dart';

import '../models/colors/constants.dart';
import '../models/hive_adapters/color_adapter.dart';

class FavoritesRepository {
  const FavoritesRepository();

  static const String _favoritesBox = 'favorite';
  static final List<List<Color>> _list = [];

  List<List<Color>> get list => _list;

  void add(List<Color> color) => _list.add(color);

  void remove(int colorIndex) => _list.removeAt(colorIndex);

  void get removeAll => _list.clear();

  static bool _boxInitialized = false;

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
        print(favoritesBox.values);
      });

  void _joinColorsLists(List<Color> onlyColors) {
    _list.clear();
    final int len = onlyColors.length, size = defaultColors.length;
    for (var i = 0; i < len; i += size) {
      final int end = (i + size < len) ? i + size : len;
      _list.add(onlyColors.sublist(i, end));
    }
    print('----------');
    print('joined data: $_list');
    print('joined data lenght: ${_list.length}');
  }

  Future<bool?> get loadStoredFavorites async {
    if (!_boxInitialized) {
      _boxInitialized = true;
      try {
        Hive.registerAdapter(ColorAdapter());
        final Box<Color> favoritesBox = await Hive.openBox<Color>(_favoritesBox);
        _joinColorsLists(favoritesBox.values.toList());
        print(favoritesBox.values);
        print('restored: ${favoritesBox.values}');
        return _list.isNotEmpty;
        // ignore: avoid_catches_without_on_clauses
      } catch (_) {
        return false;
      }
    }
  }
}
