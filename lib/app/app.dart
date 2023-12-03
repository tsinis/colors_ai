import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../about/blocs/about_bloc.dart';
import '../color_generator/models/locks/locked_colors.dart';
import '../core/extensions/context_extensions.dart';
import '../core/models/color_palette/color_palette.dart';
import '../core/repository/colors_repository.dart';
import '../core/ui/constants.dart';
import '../core/ui/view/main_screen.dart';
import '../core/ui/view/splash_screen.dart';
import '../favorites/blocs/add_favorites/fab_bloc.dart';
import '../favorites/blocs/remove_favorites/remove_favorites_bloc.dart';
import '../favorites/repository/remove_favorites_repository.dart';
import '../l10n/utils/detected_locale.dart';
import '../navigation/blocs/navigation_bloc.dart';
import '../onboarding/blocs/onboarding_bloc.dart';
import '../settings/blocs/settings_bloc.dart';
import '../settings/dao/generator_dao.dart';
import 'theme/app_theme.dart';
import 'theme/constants.dart';

class App extends StatelessWidget {
  final GeneratorDAO _generator;

  const App({required GeneratorDAO generator, super.key}) : _generator = generator;

  String onGenerateTitle(BuildContext context) {
    BlocProvider.of<AboutBloc>(context).add(
      AboutEvent.started(currentLocale: Localizations.localeOf(context).languageCode),
    );

    return kAppName;
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<SettingsBloc, SettingsState>(
        builder: (_, SettingsState settingsState) {
          if (settingsState is! SettingsChangedInitial) {
            return const SizedBox.shrink();
          }

          return MaterialApp(
            locale: detectedLocale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: AppTheme(isDark: settingsState.isDarkTheme).theme,
            onGenerateTitle: onGenerateTitle,
            home: MultiBlocProvider(
              providers: <BlocProvider<StateStreamableSource<Object?>>>[
                BlocProvider<FabBloc>(create: (_) => FabBloc()),
                BlocProvider<NavigationBloc>(create: (_) => NavigationBloc()),
                BlocProvider<RemoveFavoritesBloc>(
                  create: (_) => RemoveFavoritesBloc(
                    RemoveFavoritesRepository(Set<int>.of(<int>{})),
                  ),
                ),
              ],
              child: RepositoryProvider<ColorsRepository>(
                create: (_) => ColorsRepository(
                  colorPalette: ColorPalette(colors: List<Color>.of(<Color>[])),
                  lockedColors: LockedColors(list: List<bool>.of(<bool>[])),
                  getNewColors: _generator.fetchNewColors,
                )..init(),
                child: BlocBuilder<OnboardingBloc, OnboardingState>(
                  builder: (_, OnboardingState state) => ColoredBox(
                    color: context.theme.primaryColor,
                    child: Stack(
                      children: <Widget>[
                        const SplashScreen(),
                        AnimatedOpacity(
                          curve: kDefaultTransitionCurve,
                          duration: kDefaultLongTransitionDuration,
                          opacity: state.maybeWhen(
                            initial: () => 0,
                            loading: () => 0,
                            orElse: () => 1,
                          ),
                          child: const MainScreen(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
}
