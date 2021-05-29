import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'general/services/data_storage.dart';
import 'oboarding/blocs/onboarding/onboarding_bloc.dart';
import 'theme/services/system_overlays.dart';

//TODO: Handle Failure States in Bloc.
//TODO: Provide all text strings via l10n Bloc.
//TODO? Add settings menu.

void main() => DataStorage.init().whenComplete(() {
      SystemUI.init();
      runApp(BlocProvider<OnboardingBloc>(
        create: (_) => OnboardingBloc()..add(const OnboardingLoadDataStarted()),
        child: const App(),
      ));
    });
