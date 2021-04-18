import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  Future<void> openURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw UnsupportedError('Could not launch $url');
}
