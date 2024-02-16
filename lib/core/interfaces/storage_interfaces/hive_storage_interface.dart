import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

abstract class HiveStorageInterface<T> {
  final String _boxName;
  final HiveCipher? _encryption;
  final Box<T>? _openedBox;

  String get boxName => _boxName;

  Future<Box<T>> get openBox async => _openedBox ?? await Hive.openBox<T>(_boxName, encryptionCipher: _encryption);

  const HiveStorageInterface(HiveCipher? encryption, {required String boxName, Box<T>? openedBox})
      : _encryption = encryption,
        _boxName = boxName,
        _openedBox = openedBox;

  @protected
  Future<void> doMigration(Object? oldData);
}
