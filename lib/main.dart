import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'about/blocs/about_dialog/about_bloc.dart';
import 'app/app.dart';
import 'app/theme/services/system_overlays.dart';
import 'core/services/data_storage.dart';
import 'favorites/blocs/list_favorites/favorites_bloc.dart';
import 'oboarding/blocs/onboarding/onboarding_bloc.dart';
import 'settings/blocs/settings_hydrated_bloc.dart';

void main() => DataStorage.init().whenComplete(() {
      SystemUI.init();
      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider<FavoritesBloc>(lazy: false, create: (_) => FavoritesBloc()..add(const FavoritesStarted())),
            BlocProvider<SettingsBloc>(lazy: false, create: (_) => SettingsBloc()..add(const SettingsStarted())),
            BlocProvider<OnboardingBloc>(lazy: false, create: (_) => OnboardingBloc()..add(const OnboardingStarted())),
            BlocProvider<AboutBloc>(lazy: false, create: (_) => AboutBloc()),
          ],
          child: const App(),
        ),
      );
    });
