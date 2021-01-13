import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'colors_bloc_observer.dart';
import 'repositories/colors_repository.dart';
import 'services/system_ui/system_overlays.dart';
import 'ui/screens/navigation.dart';

//TODO: Add sounds.
//TODO: Add theme.
//TODO: Add PDF export.
//TODO: Add dif. color profiles.
//TODO: Add list saving.
//TODO: Add onboarding.
//TODO: Add app icon.
//TODO: Add share.
//TODO: Add settings menu.

void main() {
  Bloc.observer = ColorBlocObserver();
  setupSystemUI().whenComplete(() => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) => MaterialApp(
      theme: ThemeData(primarySwatch: Colors.grey),
      home: RepositoryProvider<ColorsRepository>(
          create: (_) => const ColorsRepository(), child: const NavigationScreen()));
}
