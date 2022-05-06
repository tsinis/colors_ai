import 'package:flutter/material.dart';

import '../../../app/theme/constants.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/extensions/string_extension.dart';

class AboutDialogM3 extends StatelessWidget {
  final EdgeInsetsGeometry actionsPadding;
  final Widget applicationIcon;
  final String? applicationLegalese;
  final String applicationName;
  final String applicationVersion;
  final List<Widget>? children;
  final EdgeInsetsGeometry contentPadding;
  final ShapeBorder? shape;
  final double textVerticalSeparation;

  const AboutDialogM3({
    required this.applicationName,
    required this.applicationVersion,
    required this.applicationIcon,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 24),
    this.actionsPadding = const EdgeInsets.only(bottom: 8, right: 8),
    this.textVerticalSeparation = 18,
    this.shape = kDefaultShape,
    this.applicationLegalese,
    this.children,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AlertDialog(
        actionsPadding: actionsPadding,
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
                        Text(applicationLegalese ?? '', style: context.theme.textTheme.caption),
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
            child: Text(context.materialL10n.closeButtonLabel.toBeginningOfSentenceCase()),
            onPressed: () => Navigator.pop(context),
          ),
        ],
        scrollable: true,
      );
}
