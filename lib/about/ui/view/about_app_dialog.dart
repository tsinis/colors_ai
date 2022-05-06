import 'package:clock/clock.dart';
import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/ui/constants.dart';
import '../../blocs/about_bloc.dart';
import '../widgets/about_dialog_m3.dart';
import '../widgets/app_icon.dart';

class AboutAppDialog extends StatelessWidget {
  final Widget applicationIcon;
  final String applicationLegalese;
  final TextStyle? linkTextStyle;
  final double? topPadding;
  final double width;

  const AboutAppDialog({
    this.applicationLegalese = ' © Roman Cinis',
    this.applicationIcon = const AppIcon(),
    this.topPadding = 20,
    this.linkTextStyle,
    this.width = 320,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle? linkStyle =
        linkTextStyle ?? context.theme.textTheme.bodyText2?.copyWith(color: context.theme.indicatorColor);

    return AboutDialogM3(
      applicationVersion: BlocProvider.of<AboutBloc>(context).state.appVersion,
      applicationLegalese: clock.now().year.toString() + applicationLegalese,
      applicationIcon: applicationIcon,
      applicationName: kAppName,
      children: <Widget>[
        SizedBox(height: topPadding),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: width),
          child: Text.rich(
            TextSpan(
              style: context.theme.textTheme.bodyText2,
              children: <TextSpan>[
                TextSpan(text: context.l10n.aboutGenerator),
                TextSpan(
                  style: linkStyle,
                  text: ' Colormind.io',
                  recognizer: TapGestureRecognizer()..onTap = () => _onLinkTap(context, const AboutColormindTaped()),
                ),
                TextSpan(text: ' ${context.l10n.and} '),
                TextSpan(
                  style: linkStyle,
                  text: 'Huemint.com',
                  recognizer: TapGestureRecognizer()..onTap = () => _onLinkTap(context, const AboutHuemintTaped()),
                ),
                TextSpan(text: '. ${context.l10n.aboutSourceCode}'),
                TextSpan(
                  style: linkStyle,
                  text: ' ${context.l10n.aboutSourceRepository}',
                  recognizer: TapGestureRecognizer()..onTap = () => _onLinkTap(context, const AboutSourceCodeTaped()),
                ),
                const TextSpan(text: '.'),
                TextSpan(
                  text: '\n\n${context.l10n.aboutAttribution.toUpperCase()}:\n\n${context.l10n.aboutSounds}',
                ),
                TextSpan(
                  style: linkStyle,
                  text: ' "Material Product Sounds"',
                  recognizer: TapGestureRecognizer()..onTap = () => _onLinkTap(context, const AboutSoundsTaped()),
                ),
                TextSpan(text: ' ${context.l10n.aboutByGoogle}'),
                TextSpan(
                  style: linkStyle,
                  text: ' Google',
                  recognizer: TapGestureRecognizer()..onTap = () => _onLinkTap(context, const AboutGoogleTaped()),
                ),
                TextSpan(text: ' ${context.l10n.aboutSoundsLicense}'),
                TextSpan(
                  style: linkStyle,
                  text: ' CC BY 4.0',
                  recognizer: TapGestureRecognizer()..onTap = () => _onLinkTap(context, const AboutLicensesTaped()),
                ),
                const TextSpan(text: '.'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _onLinkTap(BuildContext context, AboutEvent event) => BlocProvider.of<AboutBloc>(context).add(event);
}
