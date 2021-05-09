import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

class DataStorage {
  const DataStorage();
  static Future<Directory> get directory async => getApplicationDocumentsDirectory();

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    final Directory storage = await directory;
    HydratedBloc.storage = await HydratedStorage.build(storageDirectory: storage);
    Hive.init(storage.path);
  }
}
