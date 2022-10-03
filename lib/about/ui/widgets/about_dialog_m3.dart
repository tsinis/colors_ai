import 'package:flutter/material.dart';

import '../../../app/theme/constants.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../testing/test_keys.dart';

class AboutDialogM3 extends StatelessWidget {
  final Widget applicationIcon;
  final String applicationLegalese;
  final String applicationName;
  final String applicationVersion;
  final List<Widget> children;
  final EdgeInsetsGeometry contentPadding;
  final ShapeBorder? shape;
  final double textVerticalSeparation;

  const AboutDialogM3({
    required this.applicationName,
    required this.applicationVersion,
    required this.applicationIcon,
    required this.applicationLegalese,
    required this.children,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 24),
    this.textVerticalSeparation = 18,
    this.shape = kDefaultShape,
    super.key,
  });

  @override
  Widget build(BuildContext context) => AlertDialog(
        shape: shape,
        content: ListBody(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconTheme(data: context.theme.iconTheme, child: applicationIcon),
                Expanded(
                  child: Padding(
                    padding: contentPadding,
                    child: ListBody(
                      children: <Widget>[
                        Text(applicationName, style: context.theme.textTheme.headline5),
                        Text(applicationVersion, style: context.theme.textTheme.bodyText2),
                        SizedBox(height: textVerticalSeparation),
                        Text(applicationLegalese, style: context.theme.textTheme.caption),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ...children,
          ],
        ),
        actions: <Widget>[
          TextButton(
            key: TestKeys.viewLicensesButton,
            child: Text(context.materialL10n.viewLicensesButtonLabel.toBeginningOfSentenceCase()),
            onPressed: () => showLicensePage(
              context: context,
              applicationName: applicationName,
              applicationVersion: applicationVersion,
              applicationIcon: applicationIcon,
              applicationLegalese: applicationLegalese,
            ),
          ),
          TextButton(
            key: TestKeys.closeAboutDialogButton,
            onPressed: context.closeDialog,
            child: Text(context.materialL10n.closeButtonLabel.toBeginningOfSentenceCase()),
          ),
        ],
        scrollable: true,
      );
}
