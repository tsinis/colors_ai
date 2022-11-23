import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class FakeStorage<T> implements Storage {
  @visibleForTesting
  final Map<String, T?> map = <String, T?>{};

  int _clearCount = 0;
  int _deleteCount = 0;
  int _readCount = 0;
  int _writeCount = 0;

  int get clearCount => _clearCount;
  int get deleteCount => _deleteCount;
  int get readCount => _readCount;
  int get writeCount => _writeCount;

  int get valuesStored => map.entries.length;

  bool get hadNoInteraction => _clearCount == 0 && _deleteCount == 0 && _readCount == 0 && _writeCount == 0;

  FakeStorage({Map<String, T?>? initialData}) {
    if (initialData != null) {
      map.addAll(initialData);
    }
  }

  @override
  Future<void> clear() async {
    _clearCount++;
    map.clear();
  }

  @override
  Future<void> delete(String key) async {
    _deleteCount++;
    map.remove(key);
  }

  @override
  T? read(String key) {
    _readCount++;

    return map[key];
  }

  @override
  Future<void> write(String key, covariant T value) async {
    _writeCount++;
    map[key] = value;
  }
}
