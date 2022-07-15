import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

// Ignored because this is the only way to mock PlatformInterfaces.
// ignore: prefer_mixin
class UrlLauncherPlatformMock extends Mock with MockPlatformInterfaceMixin implements UrlLauncherPlatform {
  final bool _canLaunch;

  UrlLauncherPlatformMock({bool canLaunch = true}) : _canLaunch = canLaunch;

  @override
  Future<bool> canLaunch(String url) async => _canLaunch;

  @override
  Future<bool> launchUrl(String url, LaunchOptions options) => canLaunch(url);
}
