import 'dart:io' show Directory;

import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import '../fakes/constants.dart';

String get uniqueBoxName => const Uuid().v4();

void deleteFakeStorageDir({String directoryName = fakeStorageDir}) {
  try {
    Directory(directoryName).deleteSync(recursive: true);
  } catch (_) {}
}

void createFakeStorageDir({String path = fakeStoragePath}) => Hive.init(path);
