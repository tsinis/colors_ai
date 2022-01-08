import 'package:colors_ai/core/services/url_launcher.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

import '../../data/mocks/url_launcher_platform_mock.dart';

void main() => group('$UrlLauncher', () {
      const String url = 'url';

      test('openURL() can launch URL', () async {
        UrlLauncherPlatform.instance = UrlLauncherPlatformMock();
        const UrlLauncher urlLauncher = UrlLauncher();
        final bool canLaunch = await urlLauncher.openURL(url);
        expect(canLaunch, isTrue);
      });

      test('openURL() cannot launch URL', () async {
        UrlLauncherPlatform.instance = UrlLauncherPlatformMock(canLaunch: false);
        const UrlLauncher urlLauncher = UrlLauncher();
        final bool canLaunch = await urlLauncher.openURL(url);
        expect(canLaunch, isFalse);
      });
    });
