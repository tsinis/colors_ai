import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/ui/constants.dart';
import '../../blocs/about_dialog/about_bloc.dart';
import '../widgets/app_icon.dart';
import '../widgets/material3_dialog.dart';

class AboutAppDialog extends StatelessWidget {
  const AboutAppDialog();

  @override
  Widget build(final BuildContext context) {
    final TextStyle? linkStyle =
        Theme.of(context).textTheme.bodyText2?.copyWith(color: Theme.of(context).indicatorColor);

    return AboutDialogM3(
      applicationName: appName,
      applicationVersion: BlocProvider.of<AboutBloc>(context).state.appVersion,
      applicationLegalese: '2021 © Roman Cinis',
      applicationIcon: const AppIcon(),
      children: <Widget>[
        const SizedBox(height: 20),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 320),
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
