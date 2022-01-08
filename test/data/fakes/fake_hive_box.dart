// ignore_for_file: avoid_annotating_with_dynamic

import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

class FakeHiveBox<T> extends Fake implements Box<T> {
  final StreamController<BoxEvent> events = StreamController<BoxEvent>();
  final Map<dynamic, T> _items;
  bool _isOpen = false;
  final bool _throwCorruptedException;

  @override
  bool get isEmpty {
    if (_items.isEmpty) {
      return true;
    }
    _throwErrorIfCorrupted();

    return _items.isEmpty;
  }

  @override
  bool get isNotEmpty => !isEmpty;

  @override
  bool get isOpen => _isOpen;

  @override
  Iterable<dynamic> get keys {
    _throwErrorIfCorrupted();

    return _items.keys;
  }

  @override
  int get length {
    _throwErrorIfCorrupted();

    return _items.length;
  }

  @override
  Iterable<T> get values {
    _throwErrorIfCorrupted();

    return _items.values;
  }

  FakeHiveBox(Map<dynamic, T> items, {bool throwCorruptedException = false})
      : _items = items,
        _throwCorruptedException = throwCorruptedException;
  FakeHiveBox.empty()
      : _items = Map<dynamic, T>.fromEntries(<MapEntry<dynamic, T>>{}),
        _throwCorruptedException = false;

  FakeHiveBox.corruptedEmpty()
      : _items = Map<dynamic, T>.fromEntries(<MapEntry<dynamic, T>>{}),
        _throwCorruptedException = true;

  @override
  Future<int> add(T value) async {
    await put(_items.length + 1, value);

    return _items.length;
  }

  @override
  Future<int> clear() async {
    _markBoxAsOpen();
    final int length = _items.length;
    _items.clear();

    return length;
  }

  @override
  Future<void> close() async => _isOpen = false;

  @override
  Future<void> delete(dynamic key) async {
    _markBoxAsOpen();
    final T? value = get(key);
    _items.remove(key);
    events.add(BoxEvent(key, value, true));
  }

  @override
  Future<void> deleteAll(Iterable<dynamic> keys) async {
    _markBoxAsOpen();
    final List<BoxEvent> deleteEvents = _items.entries
        .where((MapEntry<dynamic, T> e) => keys.contains(e.key))
        .map((MapEntry<dynamic, T> e) => BoxEvent(e.key, e.value, true))
        .toList(growable: false);

    _items.removeWhere((dynamic key, _) => keys.contains(key));

    deleteEvents.forEach(events.add);
  }

  @override
  T? get(dynamic key, {T? defaultValue}) {
    _throwErrorIfCorrupted();

    return _items[key];
  }

  @override
  Future<void> put(dynamic key, T value) async {
    _markBoxAsOpen();
    _items[key] = value;
    events.add(BoxEvent(key, value, false));
  }

  @override
  Future<void> putAll(Map<dynamic, T> entries) async {
    _markBoxAsOpen();
    entries.forEach((dynamic key, T value) {
      _items[key] = value;
      events.add(BoxEvent(key, value, false));
    });
  }

  @override
  Stream<BoxEvent> watch({dynamic key}) =>
      (key == null) ? events.stream : events.stream.where((BoxEvent event) => event.key == key);

  void _markBoxAsOpen() {
    _throwErrorIfCorrupted();
    if (!isOpen) {
      _isOpen = true;
    }
  }

  void _throwErrorIfCorrupted() {
    if (_throwCorruptedException) {
      throw HiveError('Corrupted storage.');
    }
  }
}
