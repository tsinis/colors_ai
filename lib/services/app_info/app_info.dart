import 'package:package_info/package_info.dart';

class AppInfo {
  String _name = 'Colors AI', _version = '1.0.2';

  Future<void> init() async {
    final PackageInfo _packageInfo = await PackageInfo.fromPlatform();
    _name = _packageInfo.appName;
    _version = _packageInfo.version;
  }

  String get name => _name;

  String get version => _version;
}
