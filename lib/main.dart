import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'about/blocs/about_dialog/about_bloc.dart';
import 'about/repository/about_repository.dart';
import 'app/app.dart';
import 'app/theme/services/system_ui.dart';
import 'core/models/color_palette/color_palette.dart';
import 'core/services/data_storage.dart';
import 'favorites/blocs/list_favorites/favorites_bloc.dart';
import 'favorites/repository/favorites_repository.dart';
import 'favorites/services/storage_providers/favorites_hive_storage.dart';
import 'oboarding/blocs/onboarding/onboarding_bloc.dart';
import 'oboarding/repository/onboarding_repository.dart';
import 'oboarding/services/storage_providers/onboarding_hive_storage.dart';
import 'settings/blocs/settings_bloc.dart';
import 'settings/repository/settings_repository.dart';

Future<void> main() async {
  final HiveCipher? encryption = await const DataStorage().init();
  SystemUI.init();
  runApp(
    MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<AboutBloc>(lazy: false, create: (_) => AboutBloc(AboutRepository())),
        BlocProvider<SettingsBloc>(
          lazy: false,
          create: (_) => SettingsBloc(SettingsRepository())..add(const SettingsStarted()),
        ),
        BlocProvider<OnboardingBloc>(
          lazy: false,
          create: (_) => OnboardingBloc(
            OnboardingRepository(OnboardingHiveStorage(encryption: encryption)),
          )..add(const OnboardingStarted()),
        ),
        BlocProvider<FavoritesBloc>(
          create: (_) => FavoritesBloc(
            FavoritesRepository(
              List<ColorPalette>.of(<ColorPalette>[]),
              FavoritesHiveStorage(encryption: encryption),
            ),
          )..add(const FavoritesStarted()),
          lazy: false,
        ),
      ],
      child: const App(),
    ),
  );
}
