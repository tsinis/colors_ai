import 'dart:io' show Directory;

import 'package:hive/hive.dart';

import '../fakes/constants.dart';

String get uniqueBoxName => DateTime.now().toUtc().millisecondsSinceEpoch.toString();

void deleteFakeStorageDir({String directoryName = fakeStorageDir}) {
  try {
    Directory(directoryName).deleteSync(recursive: true);
    // ignore: avoid_catches_without_on_clauses
  } catch (_) {}
}

void createFakeStorageDir({String path = fakeStoragePath}) => Hive.init(path);
