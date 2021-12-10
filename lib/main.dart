import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'about/blocs/about_dialog/about_bloc.dart';
import 'about/repository/about_repository.dart';
import 'app/app.dart';
import 'app/theme/services/system_ui.dart';
import 'core/services/data_storage.dart';
import 'favorites/blocs/list_favorites/favorites_bloc.dart';
import 'favorites/repository/favorites_repository.dart';
import 'oboarding/blocs/onboarding/onboarding_bloc.dart';
import 'settings/blocs/settings_bloc.dart';
import 'settings/repository/settings_repository.dart';

Future<void> main() async {
  await DataStorage.init();
  SystemUI.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<OnboardingBloc>(lazy: false, create: (_) => OnboardingBloc()..add(const OnboardingStarted())),
        BlocProvider<AboutBloc>(lazy: false, create: (_) => AboutBloc(AboutRepository())),
        BlocProvider<SettingsBloc>(
          lazy: false,
          create: (_) => SettingsBloc(SettingsRepository())..add(const SettingsStarted()),
        ),
        BlocProvider<FavoritesBloc>(
          create: (_) => FavoritesBloc(FavoritesRepository(List.of([])))..add(const FavoritesStarted()),
          lazy: false,
        ),
      ],
      child: const App(),
    ),
  );
}
