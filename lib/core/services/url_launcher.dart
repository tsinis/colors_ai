import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  const UrlLauncher();

  Future<bool> openURL([String? url]) async {
    if (url == null) {
      return false;
    }
    final Uri? maybeUrl = Uri.tryParse(url);

    if (maybeUrl == null) {
      return false;
    }

    try {
      final bool canLaunch = await canLaunchUrl(maybeUrl);

      return canLaunch ? await launchUrl(maybeUrl) : throw UnsupportedError('Could not launch $url');
      // ignore: avoid_catches_without_on_clauses
    } catch (_) {
      return false;
    }
  }
}
