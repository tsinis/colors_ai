import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

class DataStorage {
  static Future<Directory> get directory async => getApplicationDocumentsDirectory();

  const DataStorage();

  static Future<void> init() async {
    if (kIsWeb) {
      HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: HydratedStorage.webStorageDirectory,
      );
    } else {
      WidgetsFlutterBinding.ensureInitialized();
      final Directory storage = await directory;
      HydratedBloc.storage = await HydratedStorage.build(storageDirectory: storage);
      Hive.init(storage.path);
    }
  }
}
