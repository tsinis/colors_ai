import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'favorites/blocs/add_favorites/fab_bloc.dart';
import 'favorites/blocs/list_favorites/favorites_bloc.dart';
import 'favorites/blocs/remove_favorites/remove_favs_bloc.dart';
import 'general/repository/colors_repository.dart';
import 'general/ui/view/scaffold.dart';
import 'general/ui/view/splash_screen.dart';
import 'navigation/blocs/navigation/navigation_bloc.dart';
import 'oboarding/blocs/onboarding/onboarding_bloc.dart';
import 'theme/theme.dart';

class App extends StatelessWidget {
  const App();

  @override
  Widget build(BuildContext context) => MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: appTheme,
        home: MultiBlocProvider(
          providers: [
            BlocProvider<FavoritesBloc>(create: (_) => FavoritesBloc()..add(const FavoritesLoadStarted())),
            BlocProvider<FabBloc>(create: (_) => FabBloc()),
            BlocProvider<NavigationBloc>(create: (_) => NavigationBloc()),
            BlocProvider<RemoveFavoritesBloc>(create: (_) => RemoveFavoritesBloc()),
          ],
          child: RepositoryProvider<ColorsRepository>(
            create: (_) => ColorsRepository(),
            child: BlocBuilder<OnboardingBloc, OnboardingState>(
              builder: (_, state) => ColoredBox(
                color: Theme.of(context).primaryColor,
                child: Stack(
                  children: [
                    const SplashScreen(),
                    AnimatedOpacity(
                        curve: Curves.easeInOutCubicEmphasized,
                        duration: const Duration(seconds: 1),
                        opacity: state is OnboardingLoadInProgress || state is OnboardingInitial ? 0 : 1,
                        child: const MainScreen()),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
