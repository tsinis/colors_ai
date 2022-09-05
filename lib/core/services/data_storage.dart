import 'dart:convert';
import 'dart:io';
// ignore: unnecessary_import, because DCM is not yet updated to Flutter 3.3.0
import 'dart:typed_data' show Uint8List;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import '../ui/constants.dart';

class DataStorage {
  static const String _folderName = '.$kNameForFileSystem';

  final FlutterSecureStorage _keyStorage;
  final String _secureKey;

  Future<String> get path async => _appPathFromDocsDir(await getApplicationDocumentsDirectory()).path;

  Future<HydratedCipher?> get _encryptionCipher async {
    WidgetsFlutterBinding.ensureInitialized();
    // Until https://github.com/mogol/flutter_secure_storage/issues/302.
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

    return null;
  }

  const DataStorage({
    FlutterSecureStorage keyStorage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    ),
    String secureKey = '91pT819vNhqJxtKyceNPnz5szsURIsLF',
  })  : _keyStorage = keyStorage,

        /// Key for a secure storage, value is stored on device.
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

      HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: appStorageDir,
        encryptionCipher: encryptionCipher,
      );
      Hive.init(appStorageDir.path);
    }

    return encryptionCipher;
  }

  static Directory _appPathFromDocsDir(Directory docsDir) => Directory('${docsDir.path}/$_folderName');
}
