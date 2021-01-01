import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/colors_generated/colors_bloc.dart';
import 'blocs/tab_navigation/tab_navigation.bloc.dart';
import 'colors_bloc_observer.dart';
import 'repositories/colors_repository.dart';
import 'services/system_ui/system_overlays.dart';
import 'ui/screens/navigation.dart';

void main() {
  Bloc.observer = ColorBlocObserver();
  setupSystemUI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  static const ColorsRepository _colorsRepository = ColorsRepository();

  @override
  Widget build(BuildContext context) => MaterialApp(
      theme: ThemeData(primarySwatch: Colors.grey),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<TabNavigationBloc>(create: (_) => TabNavigationBloc()),
          BlocProvider<ColorsBloc>(create: (_) => ColorsBloc(_colorsRepository)),
        ],
        child: const NavigationScreen(_colorsRepository),
      ));
}
