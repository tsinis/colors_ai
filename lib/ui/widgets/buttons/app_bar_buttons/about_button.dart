import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/about_dialog/about_bloc.dart';

class AboutButton extends StatelessWidget {
  const AboutButton();

  static const Color _linkColor = Colors.blue;

  @override
  Widget build(BuildContext context) => BlocBuilder<AboutBloc, AboutState>(
        builder: (BuildContext dialogContext, AboutState state) {
          if (state is AboutOpenInitial) {
            SchedulerBinding.instance?.addPostFrameCallback((_) async {
              showAboutDialog(
                context: context,
                applicationName: 'Colors AI',
                applicationVersion: state.appVersion,
                applicationLegalese: '2021 © Roman Cinis',
                applicationIcon: Image.asset('assets/images/app_icon.png'),
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
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => BlocProvider.of<AboutBloc>(context).add(const AboutApiProviderTaped())),
                        const TextSpan(text: '. The source code of this application is available at'),
                        TextSpan(
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(color: _linkColor),
                            text: ' this GitHub repository',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => BlocProvider.of<AboutBloc>(context).add(const AboutSourceCodeTaped())),
                        const TextSpan(text: '.'),
                        const TextSpan(text: '\n\nATTRIBUTION:\n\nUI sounds used in this application:'),
                        TextSpan(
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(color: _linkColor),
                            text: ' "Material Product Sounds"',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => BlocProvider.of<AboutBloc>(context).add(const AboutSoundAssetsTaped())),
                        const TextSpan(text: ' by'),
                        TextSpan(
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(color: _linkColor),
                            text: ' Google',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => BlocProvider.of<AboutBloc>(context).add(const AboutGoogleTaped())),
                        const TextSpan(text: ' are licensed under'),
                        TextSpan(
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(color: _linkColor),
                            text: ' CC BY 4.0',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => BlocProvider.of<AboutBloc>(context).add(const AboutLicenseTaped())),
                      ],
                    ),
                  ),
                ],
              );
            });
            BlocProvider.of<AboutBloc>(dialogContext).add(const AboutClosed());
          }
          return IconButton(
            tooltip: 'About this app',
            icon: const Icon(Icons.info_outline),
            onPressed: () => BlocProvider.of<AboutBloc>(dialogContext).add(const AboutOpened()),
          );
        },
      );
}
