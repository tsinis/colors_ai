import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  const UrlLauncher();

  Future<bool> openURL([String? url]) async {
    if (url == null) {
      return false;
    }

    try {
      final bool canLaunchUrl = await canLaunch(url);

      return canLaunchUrl ? await launch(url) : throw UnsupportedError('Could not launch $url');
      // ignore: avoid_catches_without_on_clauses
    } catch (_) {
      return false;
    }
  }
}
