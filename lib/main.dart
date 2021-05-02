import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'blocs/favorite_colors/favorites_bloc.dart';
import 'blocs/favorite_colors/favorites_event.dart';
import 'blocs/floating_action_button/fab_bloc.dart';
import 'blocs/navigation/navigation_bloc.dart';
import 'blocs/onboarding/onboarding_bloc.dart';
import 'repositories/colors_repository.dart';
import 'services/system_ui/system_overlays.dart';
import 'ui/screens/scaffold_and_navigation.dart';
import 'ui/screens/splash_screen.dart';
import 'ui/theme/theme.dart';

//TODO! Add warrning about server maintance.
//TODO: Handle Failure States in Bloc.
//TODO: Add PDF export.
//TODO: Add diff. color profiles.
//TODO: Provide all text strings via l10n Bloc.
//TODO? Add settings menu.

void main() {
  Hive.initFlutter().whenComplete(() {
    SystemUI.initUI();
    runApp(BlocProvider<OnboardingBloc>(
      create: (_) => OnboardingBloc()..add(const OnboardingLoadDataStarted()),
      child: const MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: appTheme,
        home: MultiBlocProvider(
          providers: [
            BlocProvider<FavoritesBloc>(create: (_) => FavoritesBloc()..add(const FavoritesLoadStarted())),
            BlocProvider<FabBloc>(create: (_) => FabBloc()),
            BlocProvider<NavigationBloc>(create: (_) => NavigationBloc()),
          ],
          child: RepositoryProvider<ColorsRepository>(
            create: (_) => ColorsRepository(),
            child: BlocBuilder<OnboardingBloc, OnboardingState>(
              builder: (_, state) {
                final bool isLoading = state is OnboardingLoadInProgress || state is OnboardingInitial;
                return AnimatedOpacity(
                    curve: Curves.fastOutSlowIn,
                    duration: const Duration(seconds: 2),
                    opacity: isLoading ? 0.5 : 1,
                    child: isLoading ? const SplashScreen() : const MainScreen());
              },
            ),
          ),
        ),
      );
}
