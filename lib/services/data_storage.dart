import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

class DataStorage {
  const DataStorage();
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    final Directory dir = await getApplicationDocumentsDirectory();
    HydratedBloc.storage = await HydratedStorage.build(storageDirectory: dir);
    Hive.init(dir.path);
  }
}
