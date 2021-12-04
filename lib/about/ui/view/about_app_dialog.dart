import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/ui/constants.dart';
import '../../blocs/about_dialog/about_bloc.dart';
import '../widgets/about_dialog_m3.dart';
import '../widgets/app_icon.dart';

class AboutAppDialog extends StatelessWidget {
  final Widget applicationIcon;
  final String? applicationLegalese;
  final TextStyle? linkTextStyle;
  final double? topPadding;
  final double width;

  const AboutAppDialog({
    this.applicationLegalese = '2021 © Roman Cinis',
    this.applicationIcon = const AppIcon(),
    this.topPadding = 20,
    this.linkTextStyle,
    this.width = 320,
  });

  @override
  Widget build(final BuildContext context) {
    final TextStyle? linkStyle = linkTextStyle ??
        Theme.of(context).textTheme.bodyText2?.copyWith(
              color: Theme.of(context).indicatorColor,
            );

    return AboutDialogM3(
      applicationVersion: BlocProvider.of<AboutBloc>(context).state.appVersion,
      applicationLegalese: applicationLegalese,
      applicationIcon: applicationIcon,
      applicationName: kAppName,
      children: <Widget>[
        SizedBox(height: topPadding),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: width),
          child: Text.rich(
            TextSpan(
              style: Theme.of(context).textTheme.bodyText2,
              children: [
                TextSpan(text: AppLocalizations.of(context).aboutGenerator),
                TextSpan(
                  style: linkStyle,
                  text: ' Colormind API',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => BlocProvider.of<AboutBloc>(context).add(
                          const AboutApiProviderTaped(),
                        ),
                ),
                TextSpan(text: '. ${AppLocalizations.of(context).aboutSourceCode}'),
                TextSpan(
                  style: linkStyle,
                  text: ' ${AppLocalizations.of(context).aboutSourceRepository}',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => BlocProvider.of<AboutBloc>(context).add(
                          const AboutSourceCodeTaped(),
                        ),
                ),
                const TextSpan(text: '.'),
                TextSpan(
                  text:
                      '\n\n${AppLocalizations.of(context).aboutAttribution.toUpperCase()}:\n\n${AppLocalizations.of(context).aboutSounds}',
                ),
                TextSpan(
                  style: linkStyle,
                  text: ' "Material Product Sounds"',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => BlocProvider.of<AboutBloc>(context).add(
                          const AboutSoundAssetsTaped(),
                        ),
                ),
                TextSpan(text: ' ${AppLocalizations.of(context).aboutByGoogle}'),
                TextSpan(
                  style: linkStyle,
                  text: ' Google',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => BlocProvider.of<AboutBloc>(context).add(
                          const AboutGoogleTaped(),
                        ),
                ),
                TextSpan(text: ' ${AppLocalizations.of(context).aboutSoundsLicense}'),
                TextSpan(
                  style: linkStyle,
                  text: ' CC BY 4.0',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => BlocProvider.of<AboutBloc>(context).add(
                          const AboutLicenseTaped(),
                        ),
                ),
                const TextSpan(text: '.'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
