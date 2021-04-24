import 'package:package_info/package_info.dart';

class AppInfo {
  const AppInfo();
  static late String _name, _version;

  Future<void> init() async {
    final PackageInfo _packageInfo = await PackageInfo.fromPlatform();
    _name = _packageInfo.appName;
    _version = _packageInfo.version;
  }

  String get name => _name;

  String get version => _version;
}
