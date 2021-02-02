import 'dart:ui' show Color;

import 'package:hive/hive.dart';

import '../extensions/list_color_to_color_list.dart';
import '../models/hive_adapters/color_adapter.dart';
import '../models/hive_adapters/color_list.dart';

class FavoritesRepository {
  const FavoritesRepository();

  static bool _boxInitialized = false;
  static const String _favoritesBox = 'favorite';
  static final List<List<Color>> _list = [];
  static Box<ColorList> _storageBox = Hive.box(_favoritesBox);

  List<List<Color>> get list => _list;

  void add(List<Color> color) => _list.add(color);

  void remove(int colorIndex) => _list.removeAt(colorIndex);

  void get removeAll => _list.clear();

  Future<Box<ColorList>> get _openBoxStorage async => await Hive.openBox<ColorList>(_favoritesBox);

  Future<void> get clearStorage async => _storageBox.clear();

  Future<void> get addToStorage async => _storageBox.add(_list.last.toColorList());

  // Future<void> removeFromStorage(int colorIndex) async => _storageBox.deleteAt(colorIndex);

  Future<void> get updateStorage async {
    await clearStorage;
    for (final List<Color> listColor in _list) {
      await _storageBox.add(listColor.toColorList());
    }
  }

  Future<bool?> get loadStoredFavorites async {
    if (!_boxInitialized) {
      _boxInitialized = true;
      try {
        Hive..registerAdapter(ColorListAdapter())..registerAdapter(ColorAdapter());
        _storageBox = await _openBoxStorage;
        _list.clear();
        for (final ColorList color in _storageBox.values) {
          _list.add(color.list);
        }
        return _list.isNotEmpty;
        // ignore: avoid_catches_without_on_clauses
      } catch (_) {
        return false;
      }
    }
  }
}
