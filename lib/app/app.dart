import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../color_generator/models/locks/locked_colors.dart';
import '../core/models/color_palette/color_palette.dart';
import '../core/repository/colors_repository.dart';
import '../core/ui/constants.dart';
import '../core/ui/view/main_screen.dart';
import '../core/ui/view/splash_screen.dart';
import '../favorites/blocs/add_favorites/fab_bloc.dart';
import '../favorites/blocs/remove_favorites/remove_favorites_bloc.dart';
import '../favorites/repository/remove_favorites_repository.dart';
import '../navigation/blocs/navigation/navigation_bloc.dart';
import '../oboarding/blocs/onboarding/onboarding_bloc.dart';
import '../settings/blocs/settings_bloc.dart';
import '../settings/dao/generator_dao.dart';
import 'theme/app_theme.dart';
import 'theme/constants.dart';

class App extends StatelessWidget {
  final GeneratorDAO _generator;

  const App({required GeneratorDAO generator, Key? key})
      : _generator = generator,
        super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<SettingsBloc, SettingsState>(
        builder: (_, SettingsState settingsState) {
          if (settingsState is! SettingsChangedInitial) {
            return const SizedBox.shrink();
          }

          return MaterialApp(
            title: kAppName,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: AppTheme(isDark: settingsState.isDarkTheme).theme,
            home: MultiBlocProvider(
              providers: <BlocProvider<dynamic>>[
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
                    color: Theme.of(context).primaryColor,
                    child: Stack(
                      children: <Widget>[
                        const SplashScreen(),
                        AnimatedOpacity(
                          curve: kDefaultTransitionCurve,
                          duration: kDefaultLongTransitionDuration,
                          opacity: state is OnboardingLoadInProgress || state is OnboardingInitial ? 0 : 1,
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
