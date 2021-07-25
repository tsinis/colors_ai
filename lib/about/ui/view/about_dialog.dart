import 'package:animations/animations.dart';
import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../blocs/about_dialog/about_bloc.dart';
import '../widgets/app_icon.dart';

class AboutButton extends StatelessWidget {
  const AboutButton();

  TextStyle _linkStyle(BuildContext context) =>
      Theme.of(context).textTheme.bodyText2!.copyWith(color: Theme.of(context).indicatorColor);

  @override
  Widget build(BuildContext context) => BlocBuilder<AboutBloc, AboutState>(
        builder: (dialogContext, state) {
          if (state is AboutOpenInitial) {
            SchedulerBinding.instance?.addPostFrameCallback((_) async => showModal<void>(
                context: dialogContext,
                configuration: const FadeScaleTransitionConfiguration(
                  transitionDuration: Duration(milliseconds: 400),
                  reverseTransitionDuration: Duration(milliseconds: 200),
                ),
                useRootNavigator: true,
                builder: (_) => AboutDialog(
                      applicationName: 'Colors AI',
                      applicationVersion: state.appVersion,
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
                                    style: _linkStyle(context),
                                    text: ' Colormind API',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap =
                                          () => BlocProvider.of<AboutBloc>(context).add(const AboutApiProviderTaped())),
                                TextSpan(text: '. ${AppLocalizations.of(context).aboutSourceCode}'),
                                TextSpan(
                                    style: _linkStyle(context),
                                    text: ' ${AppLocalizations.of(context).aboutSourceRepository}',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap =
                                          () => BlocProvider.of<AboutBloc>(context).add(const AboutSourceCodeTaped())),
                                const TextSpan(text: '.'),
                                TextSpan(
                                  text:
                                      '\n\n${AppLocalizations.of(context).aboutAttribution.toUpperCase()}:\n\n${AppLocalizations.of(context).aboutSounds}',
                                ),
                                TextSpan(
                                    style: _linkStyle(context),
                                    text: ' "Material Product Sounds"',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap =
                                          () => BlocProvider.of<AboutBloc>(context).add(const AboutSoundAssetsTaped())),
                                TextSpan(text: ' ${AppLocalizations.of(context).aboutByGoogle}'),
                                TextSpan(
                                    style: _linkStyle(context),
                                    text: ' Google',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap =
                                          () => BlocProvider.of<AboutBloc>(context).add(const AboutGoogleTaped())),
                                TextSpan(text: ' ${AppLocalizations.of(context).aboutSoundsLicense}'),
                                TextSpan(
                                    style: _linkStyle(context),
                                    text: ' CC BY 4.0',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap =
                                          () => BlocProvider.of<AboutBloc>(context).add(const AboutLicenseTaped())),
                                const TextSpan(text: '.'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )));
            BlocProvider.of<AboutBloc>(dialogContext).add(const AboutClosed());
          }

          return IconButton(
            tooltip: AppLocalizations.of(context).aboutThisAppTooltip,
            icon: const Icon(Icons.info_outline),
            onPressed: () => BlocProvider.of<AboutBloc>(dialogContext).add(const AboutOpened()),
          );
        },
      );
}
