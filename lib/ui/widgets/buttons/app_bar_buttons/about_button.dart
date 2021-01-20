import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import '../../../../services/url_launcher/url_launcher.dart';

class AboutButton extends StatelessWidget {
  const AboutButton();

  //TODO Provide all those data from pubspec.yaml.
  @override
  Widget build(BuildContext context) => IconButton(
        icon: const Icon(Icons.info_outline),
        onPressed: () => showAboutDialog(
          context: context,
          applicationIcon: const FlutterLogo(),
          applicationName: 'Colors AI',
          applicationVersion: '1.0.0',
          applicationLegalese: '© 2021 Roman Cinis',
          children: <Widget>[
            const SizedBox(height: 20),
            const Text('Color scheme generator that uses deep learning from Colormind API.'),
            const SizedBox(height: 20),
            SizedBox(
              width: 100,
              child: OutlinedButton.icon(
                  icon: const Icon(Mdi.github), label: const Text('SOURCE CODE'), onPressed: UrlLauncher.openURL),
            ),
          ],
        ),
      );
}
