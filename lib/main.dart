import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/floating_action_button/fab_bloc.dart';
import 'colors_bloc_observer.dart';
import 'repositories/colors_repository.dart';
import 'services/system_ui/system_overlays.dart';
import 'ui/screens/scaffold_and_navigation.dart';
import 'ui/theme/theme.dart';

//TODO: Add PDF export.
//TODO: Add list saving.
//TODO: Add onboarding.
//TODO: Handle Failure States in Bloc.
//TODO: Add dif. color profiles.
//TODO: Add app icon.
//TODO: Provide all text string via l10n Bloc.
//TODO? Add settings menu.

void main() {
  Bloc.observer = ColorBlocObserver();
  setupSystemUI().whenComplete(() => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: appTheme,
        home: BlocProvider<FabBloc>(
          create: (_) => FabBloc(),
          child: RepositoryProvider<ColorsRepository>(
            create: (_) => const ColorsRepository(),
            child: const NavigationScreen(),
          ),
        ),
      );
}
