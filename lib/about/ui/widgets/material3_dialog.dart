import 'package:flutter/material.dart';

import '../../../core/extensions/string.dart';

class AboutDialogM3 extends StatelessWidget {
  const AboutDialogM3({
    required this.applicationName,
    required this.applicationVersion,
    required this.applicationIcon,
    this.applicationLegalese,
    this.children,
    Key? key,
  }) : super(key: key);

  static const double _textVerticalSeparation = 18;

  final String applicationName;
  final String applicationVersion;
  final Widget applicationIcon;
  final String? applicationLegalese;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) => AlertDialog(
        actionsPadding: const EdgeInsets.only(bottom: 8, right: 8),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(28))),
        content: ListBody(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconTheme(data: Theme.of(context).iconTheme, child: applicationIcon),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: ListBody(
                      children: <Widget>[
                        Text(applicationName, style: Theme.of(context).textTheme.headline5),
                        Text(applicationVersion, style: Theme.of(context).textTheme.bodyText2),
                        const SizedBox(height: _textVerticalSeparation),
                        Text(applicationLegalese ?? '', style: Theme.of(context).textTheme.caption),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ...?children,
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: Text(MaterialLocalizations.of(context).viewLicensesButtonLabel.toBeginningOfSentenceCase()),
            onPressed: () => showLicensePage(
              context: context,
              applicationName: applicationName,
              applicationVersion: applicationVersion,
              applicationIcon: applicationIcon,
              applicationLegalese: applicationLegalese,
            ),
          ),
          TextButton(
            child: Text(MaterialLocalizations.of(context).closeButtonLabel.toBeginningOfSentenceCase()),
            onPressed: () => Navigator.pop(context),
          ),
        ],
        scrollable: true,
      );
}
