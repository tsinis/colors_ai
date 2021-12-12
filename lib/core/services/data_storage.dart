import 'dart:convert';
import 'dart:io';
import 'dart:typed_data' show Uint8List;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import '../../favorites/services/storage_providers/favorites_hive_storage.dart';
import '../../oboarding/services/storage_providers/onboarding_hive_storage.dart';
import '../models/color_palette/color_palette.dart';
import '../ui/constants.dart';

part 'data_storage.key.dart';

class DataStorage {
  static const String _folderName = '.$kNameForFileSystem';

  final FlutterSecureStorage _keyStorage;
  final String _secureKey;

  static Future<String> get path async => _appPathFromDocsDir(await getApplicationDocumentsDirectory()).path;

  Future<HydratedCipher?> get _encryptionCipher async {
    WidgetsFlutterBinding.ensureInitialized();
    // https://github.com/mogol/flutter_secure_storage/issues/302
    final bool containsEncryptionKey =
        await _keyStorage.containsKey(key: _secureKey) && await _keyStorage.read(key: _secureKey) != null;

    if (!containsEncryptionKey) {
      final List<int> bytesKey = Hive.generateSecureKey();
      await _keyStorage.write(key: _secureKey, value: base64UrlEncode(bytesKey));
    }

    final String? storedKey = await _keyStorage.read(key: _secureKey);

    if (storedKey != null) {
      final Uint8List encryptionKey = base64Url.decode(storedKey);

      return HydratedAesCipher(encryptionKey);
    }
  }

  const DataStorage({FlutterSecureStorage keyStorage = const FlutterSecureStorage(), String secureKey = secureKey})
      : _keyStorage = keyStorage,
        _secureKey = secureKey;

  Future<HiveCipher?> init() async {
    final HydratedCipher? encryptionCipher = await _encryptionCipher;

    if (kIsWeb) {
      HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: HydratedStorage.webStorageDirectory,
        encryptionCipher: encryptionCipher,
      );
    } else {
      final Directory docsDir = await getApplicationDocumentsDirectory();
      final Directory appStorageDir = _appPathFromDocsDir(docsDir);

      if (!appStorageDir.existsSync()) {
        await _checkAndEncryptOldHiveDb(
          oldDirPath: docsDir.path,
          newDirPath: appStorageDir.path,
          encryption: encryptionCipher,
        );
      }

      HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: appStorageDir,
        encryptionCipher: encryptionCipher,
      );
      Hive.init(appStorageDir.path);
    }

    return encryptionCipher;
  }

  static Directory _appPathFromDocsDir(Directory docsDir) => Directory('${docsDir.path}/$_folderName');

  Future<void> _checkAndEncryptOldHiveDb({
    required String oldDirPath,
    required String newDirPath,
    required HiveCipher? encryption,
  }) async {
    File oldFile(String hiveBoxName, {bool isLock = false}) {
      final String fullFileName = hiveBoxName + (isLock ? '.lock' : '.hive');

      return File('$oldDirPath/$fullFileName');
    }

    Hive.init(oldDirPath);

    const String settingsBoxName = 'hydrated_box';
    const FavoritesHiveStorage favsStorage = FavoritesHiveStorage();
    const OnboardingHiveStorage onboardStorage = OnboardingHiveStorage();

    final File oldSettingsHive = oldFile(settingsBoxName);
    final File oldOnboardingHive = oldFile(onboardStorage.boxName);
    final File oldFavoritesHive = oldFile(favsStorage.boxName);

    if (oldOnboardingHive.existsSync() || oldFavoritesHive.existsSync() || oldSettingsHive.existsSync()) {
      final bool oldOnboardingData = await onboardStorage.loadOnboardData;
      final Iterable<ColorPalette> oldFavoritesData = await favsStorage.storedFavorites;

      final File oldSettingsLock = oldFile(settingsBoxName, isLock: true);
      final File oldOnboardingLock = oldFile(onboardStorage.boxName, isLock: true);
      final File oldFavoritesLock = oldFile(favsStorage.boxName, isLock: true);

      final List<File> oldFiles = <File>[
        oldSettingsHive,
        oldSettingsLock,
        oldOnboardingHive,
        oldOnboardingLock,
        oldFavoritesLock,
        oldFavoritesHive,
      ];

      await Hive.close();
      Hive.init(newDirPath);
      await FavoritesHiveStorage(encryption: encryption).doMigration(oldFavoritesData);
      await OnboardingHiveStorage(encryption: encryption).doMigration(oldOnboardingData);
      await Hive.close();

      for (final File oldFile in oldFiles) {
        if (oldFile.existsSync()) {
          oldFile.deleteSync(recursive: true);
        }
      }
    }
  }
}
