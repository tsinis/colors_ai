import 'package:url_launcher/url_launcher.dart';
import 'constants.dart';

class UrlLauncher {
  Future<void> openURL({String url = sourceCodeURL}) async =>
      await canLaunch(url) ? await launch(url) : throw UnsupportedError('Could not launch $url');
}
