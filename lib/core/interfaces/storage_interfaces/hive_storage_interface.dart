import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

abstract class HiveStorageInterface<T> {
  final String _boxName;
  final HiveCipher? _encryption;

  String get boxName => _boxName;

  Future<Box<T>> get openBox async => Hive.openBox<T>(_boxName, encryptionCipher: _encryption);

  const HiveStorageInterface(HiveCipher? encryption, {required String boxName})
      : _encryption = encryption,
        _boxName = boxName;

  @protected
  Future<void> doMigration(Object oldData);
}
