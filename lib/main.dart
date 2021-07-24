import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'app/theme/services/system_overlays.dart';
import 'core/services/data_storage.dart';
import 'oboarding/blocs/onboarding/onboarding_bloc.dart';

//TODO! Add Roboto to file exports after License Change to OFL.
//TODO: Handle Failure States in Bloc.
//TODO Add settings menu.

void main() => DataStorage.init().whenComplete(() {
      SystemUI.init();
      runApp(BlocProvider<OnboardingBloc>(
        create: (_) => OnboardingBloc()..add(const OnboardingLoadDataStarted()),
        child: const App(),
      ));
    });
