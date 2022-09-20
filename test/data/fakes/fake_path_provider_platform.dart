import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// Ignored because this is the only way to mock PlatformInterfaces.
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
    this.applicationDocumentsPath = 'applicationDocumentsPath',
    this.applicationSupportPath = 'applicationSupportPath',
    this.externalStoragePath = 'externalStoragePath',
    this.externalCachePath = 'externalCachePath',
    this.downloadsPath = 'downloadsPath',
    this.temporaryPath = 'temporaryPath',
    this.libraryPath = 'libraryPath',
    bool throwError = false,
  }) : _throwError = throwError;

  @override
  Future<String?> getApplicationDocumentsPath() => _maybeThrowError(applicationDocumentsPath);

  @override
  Future<String?> getApplicationSupportPath() => _maybeThrowError(applicationSupportPath);

  @override
  Future<String?> getDownloadsPath() => _maybeThrowError(downloadsPath);

  @override
  Future<List<String>?> getExternalCachePaths() async => <String>[await _maybeThrowError(externalCachePath)];

  @override
  Future<String?> getExternalStoragePath() => _maybeThrowError(externalStoragePath);

  @override
  Future<List<String>?> getExternalStoragePaths({StorageDirectory? type}) async =>
      <String>[await _maybeThrowError(externalStoragePath)];

  @override
  Future<String?> getLibraryPath() => _maybeThrowError(libraryPath);

  @override
  Future<String?> getTemporaryPath() => _maybeThrowError(temporaryPath);

  Future<String> _maybeThrowError(String orElseReturn) async => _throwError
      ? throw MissingPlatformDirectoryException(
          'Unable to get $orElseReturn directory',
        )
      : orElseReturn;
}
