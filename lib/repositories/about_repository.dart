import '../services/app_info/app_info.dart';
import '../services/url_launcher/constants.dart';
import '../services/url_launcher/url_launcher.dart';

class AboutRepository {
  final AppInfo _appInfo = AppInfo();
  final UrlLauncher _urlLauncher = UrlLauncher();

  void get initAppInfo => _appInfo.init();

  String get version => _appInfo.version;
  String get name => _appInfo.name;

  void get openAboutApi => _urlLauncher.openURL(url: aboutColormindApi);
  void get openSourceCode => _urlLauncher.openURL();
  void get openAboutGoogle => _urlLauncher.openURL(url: aboutGoogle);
  void get openAboutSounds => _urlLauncher.openURL(url: materialSounds);
  void get openAboutLicenses => _urlLauncher.openURL(url: soundsLicense);
}
