import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  const UrlLauncher();

  Future<bool> openURL(String url) async {
    final Uri? maybeUrl = Uri.tryParse(url);

    if (maybeUrl == null) {
      return false;
    }

    try {
      final bool canLaunch = await canLaunchUrl(maybeUrl);

      return canLaunch ? await launchUrl(maybeUrl) : throw UnsupportedError('Could not launch $url');
    } catch (_) {
      return false;
    }
  }
}
