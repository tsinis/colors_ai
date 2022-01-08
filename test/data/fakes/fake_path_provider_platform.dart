import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// ignore: prefer_mixin
class FakePathProviderPlatform extends Fake with MockPlatformInterfaceMixin implements PathProviderPlatform {
  final String applicationDocumentsPath;
  final String applicationSupportPath;
  final String downloadsPath;
  final String externalCachePath;
  final String externalStoragePath;
  final String libraryPath;
  final String temporaryPath;

  final bool _throwError;

  FakePathProviderPlatform({
    this.temporaryPath = 'temporaryPath',
    this.applicationSupportPath = 'applicationSupportPath',
    this.downloadsPath = 'downloadsPath',
    this.libraryPath = 'libraryPath',
    this.applicationDocumentsPath = 'applicationDocumentsPath',
    this.externalCachePath = 'externalCachePath',
    this.externalStoragePath = 'externalStoragePath',
    bool throwError = false,
  }) : _throwError = throwError;

  @override
  Future<String?> getApplicationDocumentsPath() async => _maybeThrowError(applicationDocumentsPath);

  @override
  Future<String?> getApplicationSupportPath() async => _maybeThrowError(applicationSupportPath);

  @override
  Future<String?> getDownloadsPath() async => _maybeThrowError(downloadsPath);

  @override
  Future<List<String>?> getExternalCachePaths() async => <String>[_maybeThrowError(externalCachePath)];

  @override
  Future<String?> getExternalStoragePath() async => _maybeThrowError(externalStoragePath);

  @override
  Future<List<String>?> getExternalStoragePaths({StorageDirectory? type}) async =>
      <String>[_maybeThrowError(externalStoragePath)];

  @override
  Future<String?> getLibraryPath() async => _maybeThrowError(libraryPath);

  @override
  Future<String?> getTemporaryPath() async => _maybeThrowError(temporaryPath);

  String _maybeThrowError(String orElseReturn) => _throwError ? throw Exception('Path error.') : orElseReturn;
}
