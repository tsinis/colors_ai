// Ignored because that is what Hive package is providing in it's methods.
// ignore_for_file: avoid-dynamic, void_annotating_with_dynamic

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

    return _length;
  }

  @override
  Iterable<T> get values {
    _throwErrorIfCorrupted();

    return _items.values;
  }

  int get _length => _items.length;

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
    await put(_length + 1, value);

    return _length;
  }

  @override
  Future<int> clear() async {
    _markBoxAsOpen();
    final int length = _length;
    _items.clear();

    return length;
  }

  @override
  Future<void> close() async => _isOpen = false;

  @override
  Future<void> delete(Object? key) async {
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

    _items.removeWhere((Object? key, _) => keys.contains(key));

    deleteEvents.forEach(events.add);
  }

  @override
  T? get(Object? key, {T? defaultValue}) {
    _throwErrorIfCorrupted();

    return _items[key];
  }

  @override
  Future<void> put(covariant Object key, T value) async {
    _markBoxAsOpen();
    _items[key] = value;
    events.add(BoxEvent(key, value, false));
  }

  @override
  Future<Iterable<int>> addAll(Iterable<T> values) async {
    _markBoxAsOpen();
    final Set<int> indexes = <int>{};
    await Future.forEach<T>(values, (T value) async {
      indexes.add(_length);
      await add(value);
    });

    return Iterable.castFrom(indexes);
  }

  @override
  Future<void> putAll(Map<dynamic, T> entries) async {
    _markBoxAsOpen();
    entries.forEach((Object? key, T value) {
      _items[key] = value;
      events.add(BoxEvent(key, value, false));
    });
  }

  @override
  Stream<BoxEvent> watch({Object? key}) =>
      (key == null) ? events.stream : events.stream.where((BoxEvent event) => event.key == key);

  void verifyNoBoxInteractions({bool shouldBeEmpty = true, bool shouldBeOpen = false}) {
    expect(isEmpty, shouldBeEmpty);
    expect(isOpen, shouldBeOpen);
  }

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
