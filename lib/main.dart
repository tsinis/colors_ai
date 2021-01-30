import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'blocs/floating_action_button/fab_bloc.dart';
import 'blocs/navigation/navigation_bloc.dart';
import 'blocs/onboarding/onboarding_bloc.dart';
import 'colors_bloc_observer.dart';
import 'repositories/colors_repository.dart';
import 'services/system_ui/system_overlays.dart';
import 'ui/screens/scaffold_and_navigation.dart';
import 'ui/screens/splash_screen.dart';
import 'ui/theme/theme.dart';

//TODO: Handle Failure States in Bloc.
//TODO: Add PDF export.
//TODO: Add dif. color profiles.
//TODO: Add app icon.
//TODO: Provide all text strings via l10n Bloc.
//TODO? Add settings menu.

void main() {
  SystemUI.initUI().whenComplete(() async {
    Bloc.observer = ColorBlocObserver();
    await Hive.initFlutter();
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
            BlocProvider<FabBloc>(create: (_) => FabBloc()),
            BlocProvider<NavigationBloc>(create: (_) => NavigationBloc()),
          ],
          child: RepositoryProvider<ColorsRepository>(
            create: (_) => const ColorsRepository(),
            child: BlocBuilder<OnboardingBloc, OnboardingState>(
              builder: (_, state) => AnimatedOpacity(
                  duration: const Duration(seconds: 2),
                  opacity: state is OnboardingLoadInProgress ? 0.5 : 1,
                  child: state is OnboardingLoadInProgress ? const SplashScreen() : const MainScreen()),
            ),
          ),
        ),
      );
}
