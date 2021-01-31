import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';

import '../../../../services/url_launcher/constants.dart';
import '../../../../services/url_launcher/url_launcher.dart';

class AboutButton extends StatelessWidget {
  const AboutButton();

  static const Color _linkColor = Colors.blue;

  @override
  Widget build(BuildContext context) => IconButton(
        tooltip: 'About this app',
        icon: const Icon(Icons.info_outline),
        onPressed: () => showAboutDialog(
          context: context,
          applicationIcon: Image.asset('assets/images/app_icon.png'),
          //TODO Provide all those data from pubspec.yaml.
          applicationName: 'Colors AI',
          applicationVersion: '1.0.1',
          applicationLegalese: '2021 © Roman Cinis',
          children: <Widget>[
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyText2,
                children: [
                  const TextSpan(text: 'Color scheme generator that uses deep learning from'),
                  TextSpan(
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(color: _linkColor),
                      text: ' Colormind API',
                      recognizer: TapGestureRecognizer()..onTap = () => UrlLauncher.openURL(url: aboutColormindAPI)),
                  const TextSpan(text: '. The source code of this application '),
                  TextSpan(
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(color: _linkColor),
                      text: 'is available at this GitHub repository.',
                      recognizer: TapGestureRecognizer()..onTap = UrlLauncher.openURL),
                  const TextSpan(text: '\n\nATTRIBUTION:\n\nUI sounds used in this application:'),
                  TextSpan(
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(color: _linkColor),
                      text: ' "Material Product Sounds"',
                      recognizer: TapGestureRecognizer()..onTap = () => UrlLauncher.openURL(url: materialSounds)),
                  const TextSpan(text: ' by'),
                  TextSpan(
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(color: _linkColor),
                      text: ' Google',
                      recognizer: TapGestureRecognizer()..onTap = () => UrlLauncher.openURL(url: aboutGoogle)),
                  const TextSpan(text: ' are licensed under'),
                  TextSpan(
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(color: _linkColor),
                      text: ' CC BY 4.0',
                      recognizer: TapGestureRecognizer()..onTap = () => UrlLauncher.openURL(url: soundsLicense)),
                ],
              ),
            ),
          ],
        ),
      );
}
