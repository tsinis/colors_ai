import '../services/app_info/app_info.dart';
import '../services/url_launcher/constants.dart';
import '../services/url_launcher/url_launcher.dart';

class AboutRepository {
  final AppInfo _appInfo = AppInfo();
  final UrlLauncher _urlLauncher = UrlLauncher();

  void initAppInfo() => _appInfo.init();

  String get version => _appInfo.version;
  String get name => _appInfo.name;

  void openSourceCode() => _urlLauncher.openURL(sourceCode);
  void openAboutGoogle() => _urlLauncher.openURL(aboutGoogle);
  void openAboutApi() => _urlLauncher.openURL(aboutColormindApi);
  void openAboutSounds() => _urlLauncher.openURL(materialSounds);
  void openAboutLicenses() => _urlLauncher.openURL(soundsLicense);
}
