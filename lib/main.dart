import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'general/services/data_storage.dart';
import 'oboarding/blocs/onboarding/onboarding_bloc.dart';
import 'theme/services/system_overlays.dart';

//TODO! Add Robot to file exports after License Change to OFL.
//TODO Fix FAB pop-up on resize desktop.
//TODO Prevent color changes after locking.
//TODO: Handle Failure States in Bloc.
//TODO Add settings menu.
//TODO Change Android icon to SVG.
//TODO Define min size for desktops.

void main() => DataStorage.init().whenComplete(() {
      SystemUI.init();
      runApp(BlocProvider<OnboardingBloc>(
        create: (_) => OnboardingBloc()..add(const OnboardingLoadDataStarted()),
        child: const App(),
      ));
    });
