import 'package:url_launcher/url_launcher.dart';
import 'constants.dart';

class UrlLauncher {
  Future<void> openURL({String url = sourceCodeURL}) async =>
      // ignore: only_throw_errors
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
